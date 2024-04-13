//
//  AppFactory.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import UIKit


protocol AppCoordinatorFactoryProtocol {
    
    func makeMainTabBarCoordinator() -> (Presentable, Coordinator)
    func makeOnboardingCoordinator(with router: Router) -> Coordinator & OnboardingCoordinatorOutput
}


final class AppCoordinatorFactory: AppCoordinatorFactoryProtocol {
    
    func makeMainTabBarCoordinator() -> (Presentable, Coordinator) {
        let controller = MainTabBarController()
        let coordinator = MainTabBarCoordinator(
            controller: controller,
            coordinatorFactory: MainTabBarCoordinatorFactory()
        )
        return (controller, coordinator)
    }
    
    func makeOnboardingCoordinator(with router: Router) -> Coordinator & OnboardingCoordinatorOutput {
        return OnboardingCoordinator(
            router: router,
            moduleFactory: OnboardingModuleFactory(),
            coordinatorFactory: OnboardingCoordinatorFactory()
        )
    }
}
