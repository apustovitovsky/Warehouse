//
//  WelcomeScreenModuleOutput.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import Foundation


protocol WelcomeScreenModuleOutput: AnyObject {
    
    var finishModule: (() -> Void)? { get set }
}
