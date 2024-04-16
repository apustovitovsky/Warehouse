import Foundation


protocol SignUpModuleFactoryProtocol {
    func makeTermsModule(completion: ((TermsModuleOutput) -> Void)?) -> Presentable
    func makeCreateUsernameModule(completion: ((CreateUsernameModuleOutput) -> Void)?) -> Presentable
    func makeCreatePasswordModule(completion: ((CreatePasswordModuleOutput) -> Void)?) -> Presentable
    func makeSignUpSuccessModule(completion: ((SignUpSuccessModuleOutput) -> Void)?) -> Presentable
}

final class SignUpModuleFactory: SignUpModuleFactoryProtocol {
    
    func makeTermsModule(completion: ((TermsModuleOutput) -> Void)?) -> Presentable {
        let viewController = TermsViewController()
        let presenter = TermsPresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
    
    func makeCreateUsernameModule(completion: ((CreateUsernameModuleOutput) -> Void)?) -> Presentable {
        let viewController = CreateUsernameViewController()
        let presenter = CreateUsernamePresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
    
    func makeCreatePasswordModule(completion: ((CreatePasswordModuleOutput) -> Void)?) -> Presentable {
        let viewController = CreatePasswordViewController()
        let presenter = CreatePasswordPresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
    
    func makeSignUpSuccessModule(completion: ((SignUpSuccessModuleOutput) -> Void)?) -> Presentable {
        let viewController = SignUpSuccessViewController()
        let presenter = SignUpSuccessPresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
}
