//
//  CoordinatorBase.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import Foundation


class Coordinator: Flow {
    
    var childs: [Flow] = []
    
    func start() {}
    
    func add(_ coordinator: Flow) {
        guard !childs.contains(where: { $0 === coordinator }) else { return }
        childs.append(coordinator)
    }
    
    func remove(_ coordinator: Flow?) {
        childs = childs.filter{ $0 !== coordinator }
    }
}
