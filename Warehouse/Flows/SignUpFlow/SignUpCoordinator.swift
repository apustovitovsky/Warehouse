import Foundation


protocol SignUpCoordinatorOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}

final class SignUpCoordinator: Coordinator, SignUpCoordinatorOutput {
    
    var coordinators: [Coordinator] = []
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let moduleFactory: SignUpModuleFactoryProtocol
    
    init(router: Router,
         moduleFactory: SignUpModuleFactoryProtocol) {

        self.router = router
        self.moduleFactory = moduleFactory
    }
    
    func start() {
        showTerms()
    }
}

private extension SignUpCoordinator {
    
    func showTerms() {
        let module = moduleFactory.makeTermsModule { [weak self] output in
            
            output.finishModule = {
                self?.showCreateUsername()
            }
        }
        router.push(module)
    }
    
    func showCreateUsername() {
        let module = moduleFactory.makeCreateUsernameModule() { [weak self] output in
            
            output.finishModule = {
                self?.showCreatePassword()
            }
        }
        router.push(module)
    }
    
    func showCreatePassword() {
        let module = moduleFactory.makeCreatePasswordModule() { [weak self] output in
            
            output.finishModule = {
                self?.showSignUpSuccess()
            }
        }
        router.push(module)
    }
    
    func showSignUpSuccess() {
        let module = moduleFactory.makeSignUpSuccessModule() { [weak self] output in
            
            output.finishModule = {
                self?.finishFlow?()
                //self?.router.popToRoot(animated: true)
            }
        }
        router.push(module, animated: true, hideBottomBar: true)
    }
}

