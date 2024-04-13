import UIKit


protocol EnterUsernameViewControllerInput: AnyObject {}


final class EnterUsernameViewController: UIViewController, ViewController, Presentable {

    var presenter: EnterUsernamePresenterInput?
    
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

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Enter Username"
        view.backgroundColor = .darkGray
        configure()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configure() {
        view.addSubview(usernameTextField)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            usernameTextField.widthAnchor.constraint(equalToConstant: 200),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
        ])
        
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
    }

    @objc func nextTapped() {
        presenter?.nextTapped(username: usernameTextField.text)
    }
}


extension EnterUsernameViewController: EnterUsernameViewControllerInput {}
