//
//  LoginModuleFactory.swift
//  Warehouse
//
//  Created by Алексей on 11.04.2024.
//

import Foundation

protocol LoginModuleFactoryProtocol {
    
    func makeEnterUsernameModule(completion: ((EnterUsernameModuleOutput) -> Void)?) -> Presentable
    func makeEnterPasswordModule(user: User, completion: ((EnterPasswordModuleOutput) -> Void)?) -> Presentable
}

final class LoginModuleFactory: LoginModuleFactoryProtocol {

    func makeEnterUsernameModule(completion: ((EnterUsernameModuleOutput) -> Void)?) -> Presentable {
        let viewController = EnterUsernameViewController()
        let presenter = EnterUsernamePresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
    
    func makeEnterPasswordModule(user: User, completion: ((EnterPasswordModuleOutput) -> Void)?) -> Presentable {
        let viewController = EnterPasswordViewController()
        let presenter = EnterPasswordPresenter(user: user, viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
    
    func makeLoginSuccessModule(user: User, completion: ((LoginSuccessModuleOutput) -> Void)?) -> Presentable {
        let viewController = LoginSuccessViewController(user: user)
        let presenter = LoginSuccessPresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
}
