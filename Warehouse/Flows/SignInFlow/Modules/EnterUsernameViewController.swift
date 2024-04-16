import UIKit


protocol EnterUsernameViewControllerInput: AnyObject {
    
}

final class EnterUsernameViewController: UIViewController, ViewController {

    var presenter: EnterUsernamePresenterInput?
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Enter Username"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameTextField: UITextField = {
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
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .black
        configure()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configure() {
        view.addSubview(infoLabel)
        view.addSubview(usernameTextField)
        view.addSubview(nextButton)
        view.addSubview(signUpButton)

        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -24),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 24),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 64)
        ])
        
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }

    @objc func nextTapped() {
        presenter?.nextTapped()
    }    
    
    @objc func signUpTapped() {
        presenter?.signUpTapped()
    }
}

extension EnterUsernameViewController: EnterUsernameViewControllerInput {
    
}
