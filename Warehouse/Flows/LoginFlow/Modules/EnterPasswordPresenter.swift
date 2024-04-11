import Foundation


protocol EnterPasswordModuleOutput: AnyObject {
    
    var finishModule: ((User) -> Void)? { get set }
}


protocol EnterPasswordPresenterInput: AnyObject {
    
    func nextTapped(password: String?)
}


final class EnterPasswordPresenter<T: EnterPasswordViewControllerInput>: Presenter<T>, EnterPasswordModuleOutput {
    
    var finishModule: ((User) -> Void)?
    private let user: User
    
    init(user: User, view: T?) {
        self.user = user
        super.init(viewController: view)
        view?.updateTitle(with: user.username)
    }
}


extension EnterPasswordPresenter: EnterPasswordPresenterInput {
    
    func nextTapped(password: String?) {
        guard let password else { return }
        let user = User(username: user.username, password: password)
        finishModule?(user)
    }
}
