//
//  Router.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import Foundation


protocol Router: AnyObject {

    func push(_ module: Presentable?)
    func present(_ module: Presentable?)
    func dismiss(animated: Bool)
}






