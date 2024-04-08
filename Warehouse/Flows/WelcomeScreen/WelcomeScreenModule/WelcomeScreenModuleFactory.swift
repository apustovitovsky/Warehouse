//
//  WelcomeScreenModuleFactory.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import UIKit


protocol WelcomeScreenModuleFactoryProtocol {
    
    func makeWelcomeScreenModule(backgroundColor: UIColor) -> Module & WelcomeScreenModuleOutput
}


final class WelcomeScreenModuleFactory: WelcomeScreenModuleFactoryProtocol {
    
    func makeWelcomeScreenModule(backgroundColor: UIColor) -> Module & WelcomeScreenModuleOutput {
        let view = WelcomeScreenView(backgroundColor: backgroundColor)
        let presenter = WelcomeScreenPresenter(view: view)
        view.presenter = presenter
        
        return presenter
    }
}
