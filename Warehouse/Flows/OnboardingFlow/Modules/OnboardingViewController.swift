//
//  OnboardingViewController.swift
//  Warehouse
//
//  Created by Алексей on 10.04.2024.
//

import UIKit


protocol OnboardingViewControllerInput: AnyObject { }


final class OnboardingViewController: ViewController<OnboardingPresenterInput> {
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Onboarding Screen"
        view.backgroundColor = .red
        configure()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configure() {
        view.addSubview(loginButton)
        view.addSubview(signUpButton)

        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])

        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }
    
    @objc func loginTapped() {
        presenter?.loginTapped()
    }

    @objc func signUpTapped() {
        presenter?.signUpTapped()
    }
}


extension OnboardingViewController: OnboardingViewControllerInput { }

