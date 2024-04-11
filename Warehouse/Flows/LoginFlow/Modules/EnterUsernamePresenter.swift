import Foundation


protocol EnterUsernameModuleOutput: AnyObject {
    
    var finishModule: ((User) -> Void)? { get set }
}


protocol EnterUsernamePresenterInput: AnyObject {
    
    func nextTapped(username: String?)
}


final class EnterUsernamePresenter<T: EnterUsernameViewControllerInput>: Presenter<T>, EnterUsernameModuleOutput {
    
    var finishModule: ((User) -> Void)?
}


extension EnterUsernamePresenter: EnterUsernamePresenterInput {
    
    func nextTapped(username: String?) {
        guard let username else { return }
        let user = User(username: username)
        finishModule?(user)
    }
}
