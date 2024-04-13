import Foundation


protocol OnboardingModuleOutput: AnyObject {
    var toLogin: (() -> Void)? { get set }
    var toSignUp: (() -> Void)? { get set }
}

protocol OnboardingPresenterInput: AnyObject {
    func loginTapped()
    func signUpTapped()
}

final class OnboardingPresenter: Presenter, OnboardingModuleOutput {
    
    weak var viewController: OnboardingViewControllerInput?
    var toLogin: (() -> Void)?
    var toSignUp: (() -> Void)?

    init(viewController: OnboardingViewControllerInput?){
        self.viewController = viewController
    }
}

extension OnboardingPresenter: OnboardingPresenterInput {

    func loginTapped() {
        toLogin?()
    }

    func signUpTapped() {
        toSignUp?()
    }
}
