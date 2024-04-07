//
//  Flow.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import Foundation


protocol Flow: AnyObject {
    
    func start()
    func add(_ coordinator: Flow)
    func remove(_ coordinator: Flow?)
}

