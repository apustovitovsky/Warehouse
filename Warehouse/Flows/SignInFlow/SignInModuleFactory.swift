import Foundation


protocol SignInModuleFactoryProtocol {
    
    func makeEnterUsernameModule(completion: ((EnterUsernameModuleOutput) -> Void)?) -> Presentable
    func makeEnterPasswordModule(completion: ((EnterPasswordModuleOutput) -> Void)?) -> Presentable
    func makeSignInSuccessModule(completion: ((SignInSuccessModuleOutput) -> Void)?) -> Presentable
}

final class SignInModuleFactory: SignInModuleFactoryProtocol {

    func makeEnterUsernameModule(completion: ((EnterUsernameModuleOutput) -> Void)?) -> Presentable {
        let viewController = EnterUsernameViewController()
        let presenter = EnterUsernamePresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
    
    func makeEnterPasswordModule(completion: ((EnterPasswordModuleOutput) -> Void)?) -> Presentable {
        let viewController = EnterPasswordViewController()
        let presenter = EnterPasswordPresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
    
    func makeSignInSuccessModule(completion: ((SignInSuccessModuleOutput) -> Void)?) -> Presentable {
        let viewController = SignInSuccessViewController()
        let presenter = SignInSuccessPresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
}
