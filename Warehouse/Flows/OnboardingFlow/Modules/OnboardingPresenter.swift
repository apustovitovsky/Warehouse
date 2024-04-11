import Foundation


protocol OnboardingModuleOutput: AnyObject {
    
    var toLogin: (() -> Void)? { get set }
    var toSignUp: (() -> Void)? { get set }
}


protocol OnboardingPresenterInput: AnyObject {
    
    func loginTapped()
    func signUpTapped()
}


final class OnboardingPresenter<T: OnboardingViewControllerInput>: Presenter<T>, OnboardingModuleOutput {
    
    var toLogin: (() -> Void)?
    var toSignUp: (() -> Void)?
}


extension OnboardingPresenter: OnboardingPresenterInput {

    func loginTapped() {
        toLogin?()
    }

    func signUpTapped() {
        toSignUp?()
    }
}
