import UIKit


protocol TourStepTwoViewControllerInput: AnyObject { 
    
}

final class TourStepTwoViewController: UIViewController, ViewController {
    
    var presenter: TourStepTwoPresenterInput?
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Tour Step 2"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let finishButton: UIButton = {
        let button = UIButton()
        button.setTitle("Complete Tour", for: .normal)
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
        view.addSubview(finishButton)

        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            finishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finishButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 64)
        ])
        
        finishButton.addTarget(self, action: #selector(finishTapped), for: .touchUpInside)
    }
    
    @objc func finishTapped() {
        presenter?.finishTapped()
    }
}

extension TourStepTwoViewController: TourStepTwoViewControllerInput {
    
}


