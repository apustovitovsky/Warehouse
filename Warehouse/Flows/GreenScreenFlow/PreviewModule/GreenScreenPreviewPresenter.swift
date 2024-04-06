//
//  GreenScreenFirstModuleOutput.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import UIKit


protocol GreenScreenPreviewModuleOutput {
    
    var toDetails: (() -> Void)? { get set }
}

protocol GreenScreenPreviewPresenterInput {
    
    func detailsTapped() -> Void
}

final class GreenScreenPreviewPresenter: GreenScreenPreviewModuleOutput {
    
    weak var view: GreenScreenPreviewViewControllerInput?
    var toDetails: (() -> Void)?
}

extension GreenScreenPreviewPresenter: GreenScreenPreviewPresenterInput {
    
    func detailsTapped() {
        let random = Int.random(in: 1...7)
        if random == 1 {
            toDetails?()
        } else {
            view?.updateTitle(with: String(random))
        }
    }
}

extension GreenScreenPreviewPresenter: Presentable {
    
    func toPresent() -> UIViewController? {
        return view
    }
}



