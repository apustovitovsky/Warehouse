import Foundation


protocol SignInCoordinatorOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}

final class SignInCoordinator: Coordinator, SignInCoordinatorOutput {
    
    var coordinators: [Coordinator] = []
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let moduleFactory: SignInModuleFactoryProtocol
    private let coordinatorFactory: SignInCoordinatorFactoryProtocol
    
    init(router: Router,
         moduleFactory: SignInModuleFactoryProtocol,
         coordinatorFactory: SignInCoordinatorFactoryProtocol) {

        self.router = router
        self.moduleFactory = moduleFactory
        self.coordinatorFactory = coordinatorFactory
    }
    
    func start() {
        showEnterUsername()
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
        router.setRoot(module, hideBar: true)
    }
    
    func showSignUp() {
        let coordinator = coordinatorFactory.makeSignUpCoordinator(with: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.showEnterUsername()
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
                self?.router.popToRoot(animated: true)
            }
        }
        router.setRoot(module, hideBar: true)
    }
}
