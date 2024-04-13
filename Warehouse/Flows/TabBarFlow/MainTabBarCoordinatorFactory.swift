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
        return OnboardingCoordinator(
            router: Router(rootController: navController),
            moduleFactory: OnboardingModuleFactory(),
            coordinatorFactory: OnboardingCoordinatorFactory()
        )
    }
    
    func makeSessionsFlow(navController: UINavigationController) -> Coordinator {
        return OnboardingCoordinator(
            router: Router(rootController: navController),
            moduleFactory: OnboardingModuleFactory(),
            coordinatorFactory: OnboardingCoordinatorFactory()
        )
    }
    
    func makeProgressFlow(navController: UINavigationController) -> Coordinator {
        return OnboardingCoordinator(
            router: Router(rootController: navController),
            moduleFactory: OnboardingModuleFactory(),
            coordinatorFactory: OnboardingCoordinatorFactory()
        )
    }
    
    func makeSettingsFlow(navController: UINavigationController) -> Coordinator {
        return OnboardingCoordinator(
            router: Router(rootController: navController),
            moduleFactory: OnboardingModuleFactory(),
            coordinatorFactory: OnboardingCoordinatorFactory()
        )
    }
}
