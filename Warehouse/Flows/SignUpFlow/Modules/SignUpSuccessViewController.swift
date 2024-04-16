import UIKit


protocol SignUpSuccessViewControllerInput: AnyObject { 
    
}

final class SignUpSuccessViewController: UIViewController, ViewController {
    
    var presenter: SignUpSuccessPresenterInput?
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Sign Up Success!"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Complete", for: .normal)
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
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 64),
        ])
        
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
    }

    @objc func nextTapped() {
        presenter?.nextTapped()
    }
}

extension SignUpSuccessViewController: SignUpSuccessViewControllerInput {
    
}


