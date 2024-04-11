import Foundation


protocol OnboardingCoordinatorOutput: AnyObject {
    
    var finishFlow: (() -> Void)? { get set }
}


final class OnboardingCoordinator: Coordinator, OnboardingCoordinatorOutput {

    var finishFlow: (() -> Void)?

    private let router: Router
    private let moduleFactory: OnboardingModuleFactoryProtocol
    private let coordinatorFactory: OnboardingCoordinatorFactoryProtocol
    
    init(router: Router,
         moduleFactory: OnboardingModuleFactoryProtocol,
         coordinatorFactory: OnboardingCoordinatorFactoryProtocol) {

        self.router = router
        self.moduleFactory = moduleFactory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showOnboarding()
    }
}


private extension OnboardingCoordinator {
    
    func showOnboarding() {
        let module = moduleFactory.makeOnboardingModule { [weak self] output in
            
            output.toLogin = {
             self?.runLogin()
            }

            output.toSignUp = {
             self?.runSignUp()
            }
        }
        router.setRoot(module, hideBar: false)
    }
    
    func runLogin() {
        let coordinator = coordinatorFactory.makeLoginCoordinator(router: router)
        
        coordinator.finishFlow = { [weak self, weak coordinator] user in
            self?.finishFlow?()
            print(user)
            self?.remove(coordinator)
        }
        
        add(coordinator)
        coordinator.start()
    }

    func runSignUp() {
        print("To Sign Up FLow...")
    }
}
