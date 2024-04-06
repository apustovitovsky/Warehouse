//
//  GreenScreenDetailsPresenter.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import UIKit


protocol GreenScreenDetailsModuleOutput: Presentable {
    var finishModule: (() -> Void)? { get set }
}

class GreenScreenDetailsViewController: UIViewController, GreenScreenDetailsModuleOutput {
    
    var finishModule: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Green Screen Details"
        buttonTapped()
    }
    
    @objc func buttonTapped() {
        finishModule?()
    }
}
