//
//  ProductCoordinatorOutput.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import Foundation


protocol ProductCoordinatorOutput: AnyObject {
    
    var finishFlow: (() -> Void)? { get set }
}
