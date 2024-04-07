//
//  GreenScreenDetailsPresenter.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import Foundation


protocol ProductDetailsModuleOutput {
    
    var finishModule: (() -> Void)? { get set }
}


protocol ProductDetailsPresenterInput {
    
    func increaseCounter(by number: Int)
}


class ProductDetailsPresenter<View>: Presenter<View>, ProductDetailsModuleOutput where View: ProductDetailsViewInput {

    private var counter: Int = 0
    var finishModule: (() -> Void)?
}


extension ProductDetailsPresenter: ProductDetailsPresenterInput {
    
    func increaseCounter(by number: Int) {
        counter += number
        if counter >= 5 {
            finishModule?()
        } else {
            view?.updateCounter(number: counter)
        }
    }
}
