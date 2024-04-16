import UIKit


protocol OverviewViewControllerInput: AnyObject { 
    
}

final class OverviewViewController: UIViewController, ViewController {
    
    var presenter: OverviewPresenterInput?
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(label: String) {
        super.init(nibName: nil, bundle: nil)
        self.infoLabel.text = label
        view.backgroundColor = .black
        configure()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configure() {
        view.addSubview(infoLabel)
        view.addSubview(signOutButton)

        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])
        
        signOutButton.addTarget(self, action: #selector(signOutTapped), for: .touchUpInside)
    }
    
    @objc func signOutTapped() {
        presenter?.signOutTapped()
    }
}

extension OverviewViewController: OverviewViewControllerInput {
    
}


