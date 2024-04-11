import UIKit


protocol EnterPasswordViewControllerInput: AnyObject {
    
    func updateTitle(with username: String)
}


final class EnterPasswordViewController: ViewController<EnterPasswordPresenterInput> {
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .darkGray
        configure()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configure() {
        view.addSubview(passwordTextField)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
        ])
        
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
    }

    @objc func nextTapped() {
        presenter?.nextTapped(password: passwordTextField.text)
    }
}


extension EnterPasswordViewController: EnterPasswordViewControllerInput {
    
    func updateTitle(with username: String) {
        title = "Enter Password for \(username)"
    }
}
