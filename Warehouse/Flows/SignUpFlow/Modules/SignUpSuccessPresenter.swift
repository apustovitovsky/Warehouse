import Foundation


protocol SignUpSuccessModuleOutput: AnyObject {
    var finishModule: (() -> Void)? { get set }
}

protocol SignUpSuccessPresenterInput: AnyObject {
    func nextTapped()
}

final class SignUpSuccessPresenter: Presenter, SignUpSuccessModuleOutput {
    
    weak var viewController: SignUpSuccessViewControllerInput?
    var finishModule: (() -> Void)?
    
    init(viewController: SignUpSuccessViewControllerInput?){
        self.viewController = viewController
    }
}

extension SignUpSuccessPresenter: SignUpSuccessPresenterInput {
    func nextTapped() {
        finishModule?()
    }
}
