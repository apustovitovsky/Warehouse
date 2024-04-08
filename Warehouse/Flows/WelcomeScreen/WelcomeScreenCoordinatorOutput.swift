//
//  WelcomeScreenCoordinatorOutput.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import Foundation


protocol WelcomeScreenCoordinatorOutput: AnyObject {
    
    var finishFlow: (() -> Void)? { get set }
}
