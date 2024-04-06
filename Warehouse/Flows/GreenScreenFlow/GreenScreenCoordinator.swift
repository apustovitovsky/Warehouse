//
//  GreenScreenCoordinator.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


final class GreenScreenCoordinator: CoordinatorBase {
    
    private let router: Router?
    
    init(router: Router?) {
        self.router = router
    }
    
    override func start() {
        toPreviewScreen()
    }
    
    private func toPreviewScreen() {
        
        // TODO: Factory instead of creating here
        let presenter  = GreenScreenPreviewPresenter()
        let view = GreenScreenPreviewViewController(presenter: presenter)
        presenter.view = view
        
        var module: Presentable & GreenScreenPreviewModuleOutput = presenter
        
        module.toDetails = { [weak self] in
            self?.toDetailsScreen()
        }
        
        router?.push(module)
    }
    
    private func toDetailsScreen() {
        var module: GreenScreenDetailsModuleOutput = GreenScreenDetailsViewController()
        
        module.finishModule = {
            print("completed")
        }
        
        router?.push(module)
    }
}
