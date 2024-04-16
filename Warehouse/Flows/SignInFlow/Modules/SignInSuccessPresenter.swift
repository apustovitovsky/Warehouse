import Foundation


protocol SignInSuccessModuleOutput: AnyObject {
    var finishModule: (() -> Void)? { get set }
}


protocol SignInSuccessPresenterInput: AnyObject {
    func nextTapped()
}


final class SignInSuccessPresenter: Presenter, SignInSuccessModuleOutput {
    
    weak var viewController: SignInSuccessViewControllerInput?
    var finishModule: (() -> Void)?
    
    init(viewController: SignInSuccessViewControllerInput?){
        self.viewController = viewController
    }
}

extension SignInSuccessPresenter: SignInSuccessPresenterInput {
    func nextTapped() {
        finishModule?()
    }
}

