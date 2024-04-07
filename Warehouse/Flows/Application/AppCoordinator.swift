//
//  File.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


final class AppCoordinator: Coordinator {

    private var router: Router?
    private let coordinatorFactory = CoordinatorFactory()
    
    struct Dependencies {
        let router: Router?
    }
    
    init(dependencies: Dependencies) {
        self.router = dependencies.router
    }
    
    override func start() {
        pushProductScreen()
    }
    
//    private func pushGreenScreen() {
//        let coordinator = ProductCoordinator(router: router)
//        add(coordinator)
//        coordinator.start()
//    }
    
    private func pushProductScreen() {
        let coordinator = coordinatorFactory.makeProductDetailsCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            
            self?.router?.dismiss(animated: true)
            self?.remove(coordinator)
        }

        add(coordinator)
        coordinator.start()
    }
    
}
