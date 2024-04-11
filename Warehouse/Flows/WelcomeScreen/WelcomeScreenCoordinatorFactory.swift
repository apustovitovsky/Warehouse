//
//  WelcomeScreenCoordinatorFactory.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import UIKit


protocol WelcomeScreenCoordinatorFactoryProtocol {
    
    func makeWelcomeScreenCoordinator() -> (Module, Coordinator & WelcomeScreenCoordinatorOutput)
}


final class WelcomeScreenCoordinatorFactory: WelcomeScreenCoordinatorFactoryProtocol {
    
    func makeWelcomeScreenCoordinator() -> (Module, Coordinator & WelcomeScreenCoordinatorOutput) {
        let controller = UINavigationController()
        let router = Router(rootController: controller)
        let coordinator = WelcomeScreenCoordinator(
            router: router,
            moduleFactory: WelcomeScreenModuleFactory()
        )
        return (router, coordinator)
    }
}
