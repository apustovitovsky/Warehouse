//
//  GreenScreenPreviewViewController.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import UIKit

protocol GreenScreenPreviewViewControllerInput: UIViewController {
    func updateTitle(with: String)
}

class GreenScreenPreviewViewController: UIViewController {
    
    let presenter: GreenScreenPreviewPresenterInput
    
    init(presenter: GreenScreenPreviewPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        presenter.detailsTapped()
    }
}

extension GreenScreenPreviewViewController: GreenScreenPreviewViewControllerInput {
    
    func updateTitle(with suffix: String) {
        self.view.backgroundColor = .red
    }
}
