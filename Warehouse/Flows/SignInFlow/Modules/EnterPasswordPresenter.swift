import Foundation


protocol EnterPasswordModuleOutput: AnyObject {
    var finishModule: (() -> Void)? { get set }
}


protocol EnterPasswordPresenterInput: AnyObject {
    func nextTapped()
}


final class EnterPasswordPresenter: Presenter, EnterPasswordModuleOutput {
    
    weak var viewController: EnterPasswordViewControllerInput?
    var finishModule: (() -> Void)?
    
    init(viewController: EnterPasswordViewControllerInput?){
        self.viewController = viewController
    }
}


extension EnterPasswordPresenter: EnterPasswordPresenterInput {
    func nextTapped() {
//        guard let password else { return }
//        let user = User(username: user.username, password: password)
        finishModule?()
    }
}
