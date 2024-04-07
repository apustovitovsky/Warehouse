//
//  GreenScreenDetailsViewController.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import UIKit


// MARK: - ProductDetailsViewInput
protocol ProductDetailsViewInput: AnyObject {
    
    func updateCounter(number: Int)
}


// MARK: - ProductDetailsView
final class ProductDetailsView: View<ProductDetailsPresenterInput> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Green Screen Preview"
        
        increaseCounterTapped()
    }
    
    @objc func increaseCounterTapped() {
        presenter?.increaseCounter(by: 1)
    }
}


extension ProductDetailsView: ProductDetailsViewInput {
    
    func updateCounter(number: Int) {
        self.title = String(number)
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            DispatchQueue.main.async {
                self.increaseCounterTapped()
            }
        }
    }
}
