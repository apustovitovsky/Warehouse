import Foundation


protocol LoginSuccessModuleOutput: AnyObject {
    var finishModule: (() -> Void)? { get set }
}


protocol LoginSuccessPresenterInput: AnyObject {
    func nextTapped()
}


final class LoginSuccessPresenter: Presenter, LoginSuccessModuleOutput {
    
    weak var viewController: LoginSuccessViewControllerInput?
    var finishModule: (() -> Void)?
    
    init(viewController: LoginSuccessViewControllerInput?){
        self.viewController = viewController
    }
}

extension LoginSuccessPresenter: LoginSuccessPresenterInput {
    func nextTapped() {
        finishModule?()
    }
}

