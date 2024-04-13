//
//  Presentable.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


protocol Presentable {
  func toPresent() -> UIViewController?
}

extension Presentable where Self: ViewController {
      func toPresent() -> UIViewController? {
        return self
      }
}

extension Presentable where Self: Presenter, Self.T: UIViewController {
      func toPresent() -> UIViewController? {
          return viewController
      }
}

//extension ViewController where Self: Presentable {
//    func toPresent() -> UIViewController? {
//      return self
//    }
//}
