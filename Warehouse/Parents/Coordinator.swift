//
//  CoordinatorBase.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import Foundation


class Coordinator {
    
    private var childCoordinators: [Coordinator] = []

    func start() {}
    
    func add(_ coordinator: Coordinator?) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        
        if let coordinator {
            childCoordinators.append(coordinator)
        }
    }
    
    func remove(_ coordinator: Coordinator?) {
        if let coordinator {
            childCoordinators = childCoordinators.filter{ $0 !== coordinator }
        }
    }
}
