//
//  RedScreenViewController1.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


class RedScreenViewController: UIViewController {
    
    weak var coordinator: RedScreenCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "red screen"
    }
}
