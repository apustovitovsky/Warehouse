//
//  WelcomeScreenPresenter.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import Foundation


protocol WelcomeScreenPresenterInput: AnyObject {
    
    func toFinishModule()
}


final class WelcomeScreenPresenter<T>: Presenter<T>, WelcomeScreenModuleOutput where T: WelcomeScreenViewInput {
    
    var finishModule: (() -> Void)?
}


extension WelcomeScreenPresenter: WelcomeScreenPresenterInput {

    func toFinishModule() {
        finishModule?()
    }
}
