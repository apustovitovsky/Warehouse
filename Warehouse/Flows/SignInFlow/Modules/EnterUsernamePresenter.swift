import Foundation


protocol EnterUsernameModuleOutput: AnyObject {
    var finishModule: (() -> Void)? { get set }
    var toSignUp: (() -> Void)? { get set }
}


protocol EnterUsernamePresenterInput: AnyObject {
    func nextTapped()
    func signUpTapped()
}


final class EnterUsernamePresenter: Presenter, EnterUsernameModuleOutput {

    weak var viewController: EnterUsernameViewControllerInput?
    var finishModule: (() -> Void)?
    var toSignUp: (() -> Void)?
    
    init(viewController: EnterUsernameViewControllerInput?){
        self.viewController = viewController
    }
}


extension EnterUsernamePresenter: EnterUsernamePresenterInput {

    func nextTapped() {
        finishModule?()
    }
    
    func signUpTapped() {
        toSignUp?()
    }
}
