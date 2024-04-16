import Foundation


protocol TermsModuleOutput: AnyObject {
    var finishModule: (() -> Void)? { get set }
}

protocol TermsPresenterInput: AnyObject {
    func nextTapped()
}

final class TermsPresenter: Presenter, TermsModuleOutput {
    
    weak var viewController: TermsViewControllerInput?
    var finishModule: (() -> Void)?
    
    init(viewController: TermsViewControllerInput?){
        self.viewController = viewController
    }
}

extension TermsPresenter: TermsPresenterInput {
    func nextTapped() {
        finishModule?()
    }
}
