//
//  RouterBase.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit

final class RouterBase: Router {
    
    private weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    func push(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        rootController?.pushViewController(controller, animated: true)
    }
    
    func present(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        rootController?.present(controller, animated: true)
    }
}
