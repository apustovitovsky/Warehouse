//
//  BlueScreenCoordinator.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


final class BlueScreenCoordinator: CoordinatorBase {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    override func start() {
        let controller = BlueScreenViewController()
        controller.coordinator = self
        navigation.pushViewController(controller, animated: true)
    }
}
