//
//  MainTabBar.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import UIKit


final class MainTabBarCoordinator: Coordinator {
    
    private let controller: MainTabBarControllerProtocol
    private let coordinatorFactory: MainTabBarCoordinatorFactoryProtocol
    
    init(controller: MainTabBarControllerProtocol,
         coordinatorFactory: MainTabBarCoordinatorFactoryProtocol) {
        self.controller = controller
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        controller.onOverviewFlowSelect = runOverviewFlow()
        controller.onProgressFlowSelect = runProgressFlow()
        controller.onSessionsFlowSelect = runSessionsFlow()
        controller.onSettingsFlowSelect = runSettingsFlow()
    }
    
    private func runOverviewFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self?.coordinatorFactory.makeOverviewFlow(navController: navController)
                self?.add(coordinator)
                coordinator?.start()
            }
        }
    }
    
    private func runSessionsFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self?.coordinatorFactory.makeSessionsFlow(navController: navController)
                self?.add(coordinator)
                coordinator?.start()
            }
        }
    }
    
    private func runProgressFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self?.coordinatorFactory.makeProgressFlow(navController: navController)
                self?.add(coordinator)
                coordinator?.start()
            }
        }
    }
    
    private func runSettingsFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navController in
            if navController.viewControllers.isEmpty {
                let coordinator = self?.coordinatorFactory.makeSettingsFlow(navController: navController)
                self?.add(coordinator)
                coordinator?.start()
            }
        }
    }
}
