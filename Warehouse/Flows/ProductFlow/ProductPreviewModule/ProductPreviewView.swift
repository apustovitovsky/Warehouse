//
//  GreenScreenPreviewViewController.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import UIKit


protocol ProductPreviewViewInput: AnyObject {
    func updateTitle(with: String)
}


final class ProductPreviewView: View<ProductPreviewPresenterInput> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Green Screen Preview"
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
            DispatchQueue.main.async {
                self.buttonTapped()
            }
        }
    }
    
    @objc func buttonTapped() {
        presenter?.detailsTapped()
    }
}


extension ProductPreviewView: ProductPreviewViewInput {
    
    func updateTitle(with suffix: String) {
        self.view.backgroundColor = .red
    }
}
