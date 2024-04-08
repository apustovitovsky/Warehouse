//
//  RouterBase.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit

final class Router: Routable {

    private weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController?) {
        self.rootController = rootController
    }
    
    func push(_ module: Module?) {
        guard 
            let controller = module?.toPresent(),
            !(controller is UINavigationController) else { return }
        
        rootController?.pushViewController(controller, animated: true)
    }
    
    func present(_ module: Module?) {
        guard let controller = module?.toPresent() else { return }
        rootController?.present(controller, animated: true)
    }
    
    func dismiss(animated: Bool) {
        rootController?.dismiss(animated: animated)
    }
    
    func pop(animated: Bool) {
        rootController?.popViewController(animated: animated)
    }
    
    func setRoot(_ module: Module?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRoot(animated: Bool) {
        rootController?.popToRootViewController(animated: animated)
    }
}


extension Router: Module {
    
    func toPresent() -> UIViewController? {
        return rootController
    }
}
