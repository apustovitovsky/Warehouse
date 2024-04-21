import UIKit
import Combine


final class AppCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    private let router: Router
    private let coordinatorFactory: AppCoordinatorFactoryProtocol
    
    //MARK: Initial App State
    private var isAuthenticated: Bool = true
    private var isTourCompleted: Bool = true
    
    init(router: Router,
         coordinatorFactory: AppCoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    func start() {
        if isAuthenticated {
            if isTourCompleted {
                showMainFlow()
            } else {
                showTourFlow()
            }
        } else {
            showAuthFlow()
        }
    }
    
    func start(with option: DeepLinkOption?) {
        if let option {
            switch option {
            case .overview: showMainFlow()
            default:
                coordinators.forEach { coordinator in
                    coordinator.start(with: option)
                }
            }
        } else {
            start()
        }
    }
}


private extension AppCoordinator {
    
    func showTourFlow() {
        let coordinator = coordinatorFactory.makeTourCoordinator(with: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.isTourCompleted = true
            self?.start()
            self?.remove(coordinator)
        }
        add(coordinator)
        coordinator.start()
    }
    
    func showAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(with: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.isAuthenticated = true
            self?.start()
            self?.remove(coordinator)
        }
        add(coordinator)
        coordinator.start()
    }
    
    func showMainFlow() {
        let (module, coordinator) = AppCoordinatorFactory().makeMainTabBarCoordinator()
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.isAuthenticated = false
            self?.start()
            self?.remove(coordinator)
        }
        add(coordinator)
        router.setRoot(module, hideBar: true)
        coordinator.start()
    }
}
