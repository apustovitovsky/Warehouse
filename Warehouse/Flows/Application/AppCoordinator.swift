//
//  File.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


final class AppCoordinator: Coordinator {
    
    private let router: Router
    private let coordinatorFactory: AppCoordinatorFactoryProtocol
    
    init(router: Router,
         coordinatorFactory: AppCoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showOnboarding()
    }
}


private extension AppCoordinator {
    
    func showOnboarding() {
        let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
        
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
    
    func showWelcomeScreen() {
        let (module, coordinator) = WelcomeScreenCoordinatorFactory().makeWelcomeScreenCoordinator()
        coordinator.finishFlow = { [weak self, weak coordinator] in
            
            self?.router.dismiss(animated: true)
            self?.remove(coordinator)
            print("completed")
        }
        router.present(module)
        add(coordinator)
        coordinator.start()
    }
    
    func showHomeScreen() {
        let module = WelcomeScreenModuleFactory().makeWelcomeScreenModule(backgroundColor: .lightGray)
        module.finishModule = { [weak self] in
            self?.showWelcomeScreen()
        }
        router.setRoot(module, hideBar: false)
    }
}
