import Foundation


protocol SignInCoordinatorOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}

final class SignInCoordinator: Coordinator, SignInCoordinatorOutput {

    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let moduleFactory: SignInModuleFactoryProtocol
    private let coordinatorFactory: SignInCoordinatorFactoryProtocol
    
    private weak var enterUsernameModule: EnterUsernameViewController?
    
    init(router: Router,
         moduleFactory: SignInModuleFactoryProtocol,
         coordinatorFactory: SignInCoordinatorFactoryProtocol) {

        self.router = router
        self.moduleFactory = moduleFactory
        self.coordinatorFactory = coordinatorFactory
        super.init()
        
        bindDeepLink()
    }
    
    func bindDeepLink() {
        deepLinkSubject
            .unwrap()
            .map(AuthFlow.init(deeplink:))
            .unwrap()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] deeplink in
                guard let self else { return }
                switch deeplink {
                case .login: self.showEnterUsername()
                case .register: self.showSignUp()
                }
                self.resetDeeplink()
            }
            .store(in: &disposeBag)
    }
    
    override func start() {
    }
    
    override func start(with option: String?) {
    }
}

private extension SignInCoordinator {
    
    func showEnterUsername() {
        let module = moduleFactory.makeEnterUsernameModule { [weak self] output in
            
            output.finishModule = {
                self?.showEnterPassword()
            }            
            
            output.toSignUp = {
                self?.showSignUp()
            }
        }
        enterUsernameModule = module as? EnterUsernameViewController
        router.setRoot(module, hideBar: false)
    }
    
    func showSignUp() {
        let coordinator = coordinatorFactory.makeSignUpCoordinator(with: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.router.setRoot(self?.enterUsernameModule, hideBar: false, animated: true)
            self?.remove(coordinator)
        }
        add(coordinator)
        coordinator.start()
    }
    
    func showEnterPassword() {
        let module = moduleFactory.makeEnterPasswordModule() { [weak self] output in
            
            output.finishModule = {
                self?.showSignUpSuccess()
            }
        }
        router.push(module)
    }
    
    func showSignUpSuccess() {
        let module = moduleFactory.makeSignInSuccessModule() { [weak self] output in
            
            output.finishModule = {
                self?.finishFlow?()
            }
        }
        router.push(module, animated: true, hideBottomBar: true)
    }
}
