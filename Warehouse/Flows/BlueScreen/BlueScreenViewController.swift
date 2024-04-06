//
//  BlueScreenViewController.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


class BlueScreenViewController: UIViewController {
    
    weak var coordinator: BlueScreenCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "blue screen"
    }
}
