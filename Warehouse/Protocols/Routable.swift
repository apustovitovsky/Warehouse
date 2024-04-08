//
//  Router.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import Foundation


protocol Routable: AnyObject {

    func push(_ module: Module?)
    func present(_ module: Module?)
    func dismiss(animated: Bool)
    func pop(animated: Bool)
    func setRoot(_ module: Module?, hideBar: Bool)
    func popToRoot(animated: Bool)
}







