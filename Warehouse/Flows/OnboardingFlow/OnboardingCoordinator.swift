import Foundation


protocol OnboardingCoordinatorOutput: AnyObject {
    
    var finishFlow: (() -> Void)? { get set }
}


final class OnboardingCoordinator: Coordinator, OnboardingCoordinatorOutput {
    
    var coordinators: [Coordinator] = []
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
    
    func start() {
        showOnboarding()
    }
}


private extension OnboardingCoordinator {
    
    func showOnboarding() {
        let module = moduleFactory.makeOnboardingModule { [weak self] output in
            
            output.toLogin = {
             self?.showSignIn()
            }

            output.toSignUp = {
             self?.showSignUp()
            }
        }
        router.setRoot(module, hideBar: false)
    }
    
    func showSignIn() {
        let coordinator = coordinatorFactory.makeLoginCoordinator(with: router)
        
        coordinator.finishFlow = { [weak self, weak coordinator] user in
            self?.finishFlow?()
            print(user)
            self?.remove(coordinator)
        }
        
        add(coordinator)
        coordinator.start()
    }

    func showSignUp() {
        print("To Sign Up Flow...")
    }
}
