//
//  LoginModuleFactory.swift
//  Warehouse
//
//  Created by Алексей on 11.04.2024.
//

import Foundation

protocol LoginModuleFactoryProtocol {
    
    func makeEnterUsernameModule(completion: ((EnterUsernameModuleOutput) -> Void)?) -> Module
    func makeEnterPasswordModule(user: User, completion: ((EnterPasswordModuleOutput) -> Void)?) -> Module
}

final class LoginModuleFactory: LoginModuleFactoryProtocol {

    func makeEnterUsernameModule(completion: ((EnterUsernameModuleOutput) -> Void)?) -> Module {
        let viewController = EnterUsernameViewController()
        let presenter = EnterUsernamePresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
    
    func makeEnterPasswordModule(user: User, completion: ((EnterPasswordModuleOutput) -> Void)?) -> Module {
        let viewController = EnterPasswordViewController()
        let presenter = EnterPasswordPresenter(user: user, view: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
    
    func makeLoginSuccessModule(user: User, completion: ((LoginSuccessModuleOutput) -> Void)?) -> Module {
        let viewController = LoginSuccessViewController(user: user)
        let presenter = LoginSuccessPresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
}
