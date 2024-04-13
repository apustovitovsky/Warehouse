import Foundation


protocol EnterUsernameModuleOutput: AnyObject {
    var finishModule: ((User) -> Void)? { get set }
}


protocol EnterUsernamePresenterInput: AnyObject {
    func nextTapped(username: String?)
}


final class EnterUsernamePresenter: Presenter, EnterUsernameModuleOutput {
 
    weak var viewController: EnterUsernameViewControllerInput?
    var finishModule: ((User) -> Void)?
    
    init(viewController: EnterUsernameViewControllerInput?){
        self.viewController = viewController
    }
}


extension EnterUsernamePresenter: EnterUsernamePresenterInput {
    func nextTapped(username: String?) {
        guard let username else { return }
        let user = User(username: username)
        finishModule?(user)
    }
}
