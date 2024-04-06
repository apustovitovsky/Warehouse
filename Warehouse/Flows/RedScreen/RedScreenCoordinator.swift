//
//  RedScreenCoordinator1.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


final class RedScreenCoordinator: CoordinatorBase {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    override func start() {
        let controller = RedScreenViewController()
        controller.coordinator = self
        navigation.pushViewController(controller, animated: true)
    }
}
