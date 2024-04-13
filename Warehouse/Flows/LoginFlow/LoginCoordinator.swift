import Foundation


protocol LoginCoordinatorOutput: AnyObject {
    
    var finishFlow: ((User) -> Void)? { get set }
}

final class LoginCoordinator: Coordinator, LoginCoordinatorOutput {
    
    var coordinators: [Coordinator] = []
    var finishFlow: ((User) -> Void)?
    
    private let router: Router
    private let moduleFactory: LoginModuleFactory
    
    init(router: Router,
         moduleFactory: LoginModuleFactory) {

        self.router = router
        self.moduleFactory = moduleFactory
    }
    
    func start() {
        showEnterUsername()
    }
}


private extension LoginCoordinator {
    
    func showEnterUsername() {
        let module = moduleFactory.makeEnterUsernameModule { [weak self] output in
            
            output.finishModule = { user in
                self?.showEnterPassword(user: user)
            }
        }
        router.push(module)
    }
    
    func showEnterPassword(user: User) {
        let module = moduleFactory.makeEnterPasswordModule(user: user) { [weak self] output in
            
            output.finishModule = { user in
                self?.showLoginSuccess(user: user)
            }
        }
        router.push(module)
    }
    
    private func showLoginSuccess(user: User) {
        let module = moduleFactory.makeLoginSuccessModule(user: user) { [weak self] output in
            
            output.finishModule = {
                self?.finishFlow?(user)
                self?.router.popToRoot(animated: true)
            }
        }
        router.setRoot(module, hideBar: true)
    }
}
