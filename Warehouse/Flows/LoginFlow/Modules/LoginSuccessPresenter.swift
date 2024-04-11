import Foundation


protocol LoginSuccessModuleOutput: AnyObject {
    
    var finishModule: (() -> Void)? { get set }
}


protocol LoginSuccessPresenterInput: AnyObject {
    
    func nextTapped()
}


final class LoginSuccessPresenter<T: LoginSuccessViewControllerInput>: Presenter<T>, LoginSuccessModuleOutput {
    
    var finishModule: (() -> Void)?
}


extension LoginSuccessPresenter: LoginSuccessPresenterInput {
    
    func nextTapped() {
        finishModule?()
    }
}

