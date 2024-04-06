//
//  File.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


final class AppCoordinator: CoordinatorBase {

    private var router: Router?
    
    struct Dependencies {
        let router: Router?
    }
    
    init(dependencies: Dependencies) {
        self.router = dependencies.router
    }
    
    override func start() {
        pushGreenScreen()
    }
    
    private func pushGreenScreen() {
        let coordinator = GreenScreenCoordinator(router: router)
        add(coordinator)
        coordinator.start()
    }
    
    private func pushRedScreen() {
        let coordinator = GreenScreenCoordinator(router: router)
        add(coordinator)
        coordinator.start()
    }
    
}
