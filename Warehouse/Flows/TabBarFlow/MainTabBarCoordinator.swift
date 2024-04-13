//
//  MainTabBar.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import UIKit


final class MainTabBarCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    private let controller: MainTabBarControllerOutput
    private let coordinatorFactory: MainTabBarCoordinatorFactoryProtocol
    
    init(controller: MainTabBarControllerOutput,
         coordinatorFactory: MainTabBarCoordinatorFactoryProtocol) {
        self.controller = controller
        self.coordinatorFactory = coordinatorFactory
    }
    
    func start() {
        controller.onOverviewFlowSelect = runOverviewFlow()
        controller.onProgressFlowSelect = runProgressFlow()
        controller.onSessionsFlowSelect = runSessionsFlow()
        controller.onSettingsFlowSelect = runSettingsFlow()
    }
    
}
private extension MainTabBarCoordinator {
    
    func runOverviewFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self?.coordinatorFactory.makeOverviewFlow(navController: navController)
                self?.add(coordinator)
                coordinator?.start()
            }
        }
    }
    
    func runSessionsFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self?.coordinatorFactory.makeSessionsFlow(navController: navController)
                self?.add(coordinator)
                coordinator?.start()
            }
        }
    }
    
    func runProgressFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self?.coordinatorFactory.makeProgressFlow(navController: navController)
                self?.add(coordinator)
                coordinator?.start()
            }
        }
    }
    
    func runSettingsFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self?.coordinatorFactory.makeSettingsFlow(navController: navController)
                self?.add(coordinator)
                coordinator?.start()
            }
        }
    }
}
