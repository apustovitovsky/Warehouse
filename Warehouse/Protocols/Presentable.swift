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

extension UIViewController: Presentable {
  
  func toPresent() -> UIViewController? {
    return self
  }
}



