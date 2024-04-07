//
//  GreenScreenCoordinator.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


final class ProductCoordinator: Coordinator, ProductCoordinatorOutput {

    private let router: Router?
    var finishFlow: (() -> Void)?
    
    init(router: Router?) {
        self.router = router
    }
    
    override func start() {
        toPreviewScreen()
    }
    
    private func toPreviewScreen() {
        let view = ProductPreviewView()
        let presenter = ProductPreviewPresenter(view: view, dependencies: .init())
        view.presenter = presenter
        
        presenter.toDetails = { [weak self] in
            self?.toDetailsScreen()
        }
        
        router?.push(presenter)
    }
    
    private func toDetailsScreen() {
        let view = ProductDetailsView()
        let presenter = ProductDetailsPresenter(view: view)
        view.presenter = presenter
        
        presenter.finishModule = { [weak self] in

            self?.finishFlow?()
        }

        router?.push(view)
    }
}
