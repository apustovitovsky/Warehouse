import Foundation


protocol CreateUsernameModuleOutput: AnyObject {
    var finishModule: (() -> Void)? { get set }
}

protocol CreateUsernamePresenterInput: AnyObject {
    func nextTapped()
}

final class CreateUsernamePresenter: Presenter, CreateUsernameModuleOutput {
    
    weak var viewController: CreateUsernameViewControllerInput?
    var finishModule: (() -> Void)?
    
    init(viewController: CreateUsernameViewControllerInput?){
        self.viewController = viewController
    }
}

extension CreateUsernamePresenter: CreateUsernamePresenterInput {
    func nextTapped() {
        finishModule?()
    }
}
