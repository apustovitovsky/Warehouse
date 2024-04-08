//
//  MainTabBarCoordinatorFactory.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import UIKit


protocol MainTabBarCoordinatorFactoryProtocol {
    
    func makeOverviewFlow(navController: UINavigationController) -> Coordinator
    func makeSessionsFlow(navController: UINavigationController) -> Coordinator
    func makeProgressFlow(navController: UINavigationController) -> Coordinator
    func makeSettingsFlow(navController: UINavigationController) -> Coordinator
}


final class MainTabBarCoordinatorFactory: MainTabBarCoordinatorFactoryProtocol {
    
    func makeOverviewFlow(navController: UINavigationController) -> Coordinator {
        let coordinator = WelcomeScreenCoordinator(
            router: Router(rootController: navController),
            moduleFactory: WelcomeScreenModuleFactory()
        )
        return coordinator
    }
    
    func makeSessionsFlow(navController: UINavigationController) -> Coordinator {
        let coordinator = WelcomeScreenCoordinator(
            router: Router(rootController: navController),
            moduleFactory: WelcomeScreenModuleFactory()
        )
        return coordinator
    }
    
    func makeProgressFlow(navController: UINavigationController) -> Coordinator {
        let coordinator = WelcomeScreenCoordinator(
            router: Router(rootController: navController),
            moduleFactory: WelcomeScreenModuleFactory()
        )
        return coordinator
    }
    
    func makeSettingsFlow(navController: UINavigationController) -> Coordinator {
        let coordinator = WelcomeScreenCoordinator(
            router: Router(rootController: navController),
            moduleFactory: WelcomeScreenModuleFactory()
        )
        return coordinator
    }
}
