import Foundation


protocol CreatePasswordModuleOutput: AnyObject {
    var finishModule: (() -> Void)? { get set }
}

protocol CreatePasswordPresenterInput: AnyObject {
    func nextTapped()
}

final class CreatePasswordPresenter: Presenter, CreatePasswordModuleOutput {
    
    weak var viewController: CreatePasswordViewControllerInput?
    var finishModule: (() -> Void)?
    
    init(viewController: CreatePasswordViewControllerInput?){
        self.viewController = viewController
    }
}

extension CreatePasswordPresenter: CreatePasswordPresenterInput {
    func nextTapped() {
        finishModule?()
    }
}
