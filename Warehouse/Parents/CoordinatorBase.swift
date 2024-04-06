//
//  CoordinatorBase.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import Foundation


class CoordinatorBase: Coordinator {
    
    private var childs: [Coordinator] = []
    
    func start() {}
    
    func add(_ coordinator: Coordinator) {
        guard !childs.contains(where: { $0 === coordinator }) else { return }
        childs.append(coordinator)
    }
    
    func remove(_ coordinator: Coordinator) {
        childs = childs.filter{ $0 !== coordinator }
    }
}
