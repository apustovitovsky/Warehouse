//
//  WelcomeScreenView.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import UIKit


protocol WelcomeScreenViewInput: AnyObject {

}


final class WelcomeScreenView: ViewController<WelcomeScreenPresenterInput> {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome Screen"
        configure()
    }
    
    private func configure() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        button.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }
    
    @objc func confirmButtonTapped() {
        presenter?.toFinishModule()
    }
}


extension WelcomeScreenView: WelcomeScreenViewInput {
    
}
