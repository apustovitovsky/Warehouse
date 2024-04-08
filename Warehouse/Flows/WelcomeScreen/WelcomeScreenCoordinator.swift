//
//  WelcomeScreenCoordinator.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import Foundation


final class WelcomeScreenCoordinator: Coordinator, WelcomeScreenCoordinatorOutput {
    
    private var router: Router
    private let moduleFactory: WelcomeScreenModuleFactoryProtocol
    
    var finishFlow: (() -> Void)?
    
    init(router: Router, moduleFactory: WelcomeScreenModuleFactoryProtocol) {
        self.router = router
        self.moduleFactory = moduleFactory
    }
    
    override func start() {
        toWelcomeScreen()
    }
    
    private func toWelcomeScreen() {
        let module = moduleFactory.makeWelcomeScreenModule(backgroundColor: .systemGreen)

        module.finishModule = { [weak self] in
            self?.toWelcomeScreenSecond()
        }
        
        router.setRoot(module, hideBar: false)
    }
    
    private func toWelcomeScreenSecond() {
        let module = moduleFactory.makeWelcomeScreenModule(backgroundColor: .systemRed)

        module.finishModule = { [weak self] in
            self?.finishFlow?()
            self?.router.pop(animated: true)
        }
        
        router.push(module)
    }
}

