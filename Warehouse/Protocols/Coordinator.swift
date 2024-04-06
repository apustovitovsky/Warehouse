//
//  Coordinator.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import Foundation


protocol Coordinator: AnyObject {
    
    func start()
    func add(_ coordinator: Coordinator)
    func remove(_ coordinator: Coordinator)
}

