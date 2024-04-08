//
//  Presentable.swift
//  Warehouse
//
//  Created by Алексей on 06.04.2024.
//

import UIKit


protocol Module: AnyObject {
    
  func toPresent() -> UIViewController?
}


extension UIViewController: Module {
  
  func toPresent() -> UIViewController? {
      
    return self
  }
}



