import Foundation


protocol OverviewModuleOutput: AnyObject {
    var finishModule: (() -> Void)? { get set }
}

protocol OverviewPresenterInput: AnyObject {
    func signOutTapped()
}

final class OverviewPresenter: Presenter, OverviewModuleOutput {
    
    weak var viewController: OverviewViewControllerInput?
    var finishModule: (() -> Void)?
    
    init(viewController: OverviewViewControllerInput?){
        self.viewController = viewController
    }
}

extension OverviewPresenter: OverviewPresenterInput {
    func signOutTapped() {
        finishModule?()
    }
}
