import UIKit
import Combine


protocol OverviewViewControllerInput: AnyObject {
    
}

final class OverviewViewController: UIViewController, ViewController {
    
    var presenter: OverviewPresenterInput?
    var cancellables: Set<AnyCancellable> = []

    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signOutTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.setTitle("Sign Out", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(label: String) {
        super.init(nibName: nil, bundle: nil)
        self.infoLabel.text = label
        view.backgroundColor = .black
        configure()
        
        
        let sub = PassthroughSubject<String, Never>()
        let pub = PassthroughSubject<String, Never>()
        pub.subscribe(sub).store(in: &cancellables)
        sub.sink{ value in
            print("value is \(value)")
        }.store(in: &cancellables)
        
        sub.send("hello")
        
        signOutTextField.textPublisher
            .debounce(for: 1, scheduler: DispatchQueue.main)
            .map{ $0 == "sign out" }
            .sink { [weak self] isEnabled in
                self?.signOutButton.isEnabled = !isEnabled
            }
            .store(in: &cancellables)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configure() {
        view.addSubview(infoLabel)
        view.addSubview(signOutTextField)
        view.addSubview(signOutButton)

        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            signOutTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -24),
            signOutTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            signOutTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])
        
        signOutButton.addTarget(self, action: #selector(signOutTapped), for: .touchUpInside)
    }
    
    @objc func signOutTapped() {
        presenter?.signOutTapped()
    }
}

fileprivate extension UITextField {
    var textPublisher: AnyPublisher<String?, Never> {
        return NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)
            .compactMap{ $0.object as? UITextField }
            .map { $0.text }
            .eraseToAnyPublisher()
    }
}

extension OverviewViewController: OverviewViewControllerInput {
    
}


