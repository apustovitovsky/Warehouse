//
//  CoordinatorFactory.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import UIKit


protocol CoordinatorFactoryProtocol {
    
    func makeProductDetailsCoordinator(router: Router?) ->
    Coordinator & ProductCoordinatorOutput
}


final class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    func makeProductDetailsCoordinator(router: Router?) ->
    Coordinator & ProductCoordinatorOutput {
        
        //let router = RouterBase(rootController: navController)
        let coordinator = ProductCoordinator(router: router)
        
        return coordinator
    }
}

