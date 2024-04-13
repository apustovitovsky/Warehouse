//
//  Router.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import Foundation


protocol Routable: AnyObject {

    func push(_ module: Presentable?)
    func present(_ module: Presentable?)
    func dismiss(animated: Bool)
    func pop(animated: Bool)
    func setRoot(_ module: Presentable?, hideBar: Bool)
    func popToRoot(animated: Bool)
}







