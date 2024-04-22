import Foundation


protocol AppTabBarCoordinatorOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}

final class AppTabBarCoordinator: Coordinator, AppTabBarCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    private let controller: AppTabBarControllerOutput
    private let coordinatorFactory: AppTabBarCoordinatorFactoryProtocol
    
    init(controller: AppTabBarControllerOutput,
         coordinatorFactory: AppTabBarCoordinatorFactoryProtocol) {
        
        self.controller = controller
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        makeOverviewFlow()
        makeSessionsFlow()
        makeProgressFlow()
        makeSettingsFlow()
    }
    
    override func start(with option: String?) {

    }
}

private extension AppTabBarCoordinator {
    
    func makeOverviewFlow() {
        controller.makeOverviewFlow = { [weak self] navigation in
            let coordinator = self?.coordinatorFactory.makeOverviewFlow(navController: navigation)
            
            coordinator?.finishFlow = {
                self?.finishFlow?()
            }
            
            self?.add(coordinator)
            coordinator?.start()
        }
    }
    
    func makeSessionsFlow() {
        controller.makeSessionsFlow = { [weak self] navigation in
            let coordinator = self?.coordinatorFactory.makeSessionsFlow(navController: navigation)
            
            coordinator?.finishFlow = {
                self?.finishFlow?()
            }
            
            self?.add(coordinator)
            coordinator?.start()
        }
    }
    
    func makeProgressFlow() {
        controller.makeProgressFlow = { [weak self] navigation in
            let coordinator = self?.coordinatorFactory.makeProgressFlow(navController: navigation)
            
            coordinator?.finishFlow = {
                self?.finishFlow?()
            }
            
            self?.add(coordinator)
            coordinator?.start()
        }
    }
    
    func makeSettingsFlow() {
        controller.makeSettingsFlow = { [weak self] navigation in
            let coordinator = self?.coordinatorFactory.makeSettingsFlow(navController: navigation)
            
            coordinator?.finishFlow = {
                self?.finishFlow?()
            }
            
            self?.add(coordinator)
            coordinator?.start()
        }
    }
}

