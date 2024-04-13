import Foundation


protocol EnterPasswordModuleOutput: AnyObject {
    var finishModule: ((User) -> Void)? { get set }
}


protocol EnterPasswordPresenterInput: AnyObject {
    func nextTapped(password: String?)
}


final class EnterPasswordPresenter: Presenter, EnterPasswordModuleOutput {
    
    weak var viewController: EnterPasswordViewControllerInput?
    var finishModule: ((User) -> Void)?
    private let user: User
    
    init(user: User, viewController: EnterPasswordViewControllerInput?){
        self.user = user
        self.viewController = viewController
    }
}


extension EnterPasswordPresenter: EnterPasswordPresenterInput {
    func nextTapped(password: String?) {
        guard let password else { return }
        let user = User(username: user.username, password: password)
        finishModule?(user)
    }
}
