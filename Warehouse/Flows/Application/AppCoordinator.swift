//
//  File.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


final class AppCoordinator: Coordinator {
    var coordinators: [Coordinator] = []
    private let router: Router
    private let coordinatorFactory: AppCoordinatorFactoryProtocol
    
    init(router: Router,
         coordinatorFactory: AppCoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    func start() {
        showOnboarding()
    }
}


private extension AppCoordinator {
    func showOnboarding() {
        let coordinator = coordinatorFactory.makeOnboardingCoordinator(with: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.showMainTabBarFlow()
            self?.remove(coordinator)
        }
        add(coordinator)
        coordinator.start()
    }
    
    func showMainTabBarFlow() {
        let (module, coordinator) = AppCoordinatorFactory().makeMainTabBarCoordinator()
        add(coordinator)
        router.setRoot(module, hideBar: true)
        coordinator.start()
    }
}
