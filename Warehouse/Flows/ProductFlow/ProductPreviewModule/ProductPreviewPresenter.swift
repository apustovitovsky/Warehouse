//
//  GreenScreenFirstModuleOutput.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import Foundation


protocol ProductPreviewModuleOutput {
    
    var toDetails: (() -> Void)? { get set }
}


protocol ProductPreviewPresenterInput {
    
    func detailsTapped() -> Void
}


final class ProductPreviewPresenter<View>: Presenter<View>, ProductPreviewModuleOutput where View: ProductPreviewViewInput {
    
    private let dependencies: Dependencies
    
    struct Dependencies {
        
    }
    
    init(view: View, dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init(view: view)
    }
    
    var toDetails: (() -> Void)?
}


extension ProductPreviewPresenter: ProductPreviewPresenterInput {
    
    func detailsTapped() {
        let random = Int.random(in: 1...1)
        if random == 1 {
            toDetails?()
        } else {
            view?.updateTitle(with: String(random))
        }
    }
}




