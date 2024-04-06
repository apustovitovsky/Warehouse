//
//  PresenterBase.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import UIKit


class PresenterBase {
    
    weak var view: UIViewController?

}

extension PresenterBase: Presentable {
    
    func toPresent() -> UIViewController? {
        return view
    }
}


