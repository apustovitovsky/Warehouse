import UIKit


protocol TourStepOneViewControllerInput: AnyObject { 
    
}

final class TourStepOneViewController: UIViewController, ViewController {
    
    var presenter: TourStepOnePresenterInput?
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Tour Step 1"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue..", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip Tour", for: .normal)
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
        view.addSubview(skipButton)

        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 24),
            skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skipButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 64)
        ])
        
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
    }
    
    @objc func nextTapped() {
        presenter?.nextTapped()
    }
    
    @objc func skipTapped() {
        presenter?.skipTapped()
    }
}

extension TourStepOneViewController: TourStepOneViewControllerInput {
    
}


