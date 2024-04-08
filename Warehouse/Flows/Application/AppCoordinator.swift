//
//  File.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


final class AppCoordinator: Coordinator {

    private let router: Router
    private let coordinatorFactory: WelcomeScreenCoordinatorFactoryProtocol
    private let moduleFactory: WelcomeScreenModuleFactoryProtocol
    
    init(router: Router,
         coordinatorFactory: WelcomeScreenCoordinatorFactoryProtocol,
         moduleFactory: WelcomeScreenModuleFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.moduleFactory = moduleFactory
    }
    
    override func start() {
        showMainTabBarFlow()
    }
    
    private func showMainTabBarFlow() {
        let (module, coordinator) = AppCoordinatorFactory().makeMainTabBarCoordinator()
        add(coordinator)
        router.setRoot(module, hideBar: true)
        coordinator.start()
    }
    
    private func showWelcomeScreen() {
        let (module, coordinator) = coordinatorFactory.makeWelcomeScreenCoordinator()
        coordinator.finishFlow = { [weak self, weak coordinator] in
            
            self?.router.dismiss(animated: true)
            self?.remove(coordinator)
            print("completed")
        }
        router.present(module)
        add(coordinator)
        coordinator.start()
    }
    
    private func showHomeScreen() {
        let module = moduleFactory.makeWelcomeScreenModule(backgroundColor: .lightGray)
        module.finishModule = { [weak self] in
            self?.showWelcomeScreen()
        }
        router.setRoot(module, hideBar: false)
    }
}
