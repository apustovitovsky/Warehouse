import Foundation


protocol SignInCoordinatorFactoryProtocol {
    func makeSignUpCoordinator(with router: Router) -> Coordinator & SignUpCoordinatorOutput
}


final class SignInCoordinatorFactory: SignInCoordinatorFactoryProtocol {
    
    func makeSignUpCoordinator(with router: Router) -> Coordinator & SignUpCoordinatorOutput {
        return SignUpCoordinator(
            router: router,
            moduleFactory: SignUpModuleFactory()
        )
    }
}
