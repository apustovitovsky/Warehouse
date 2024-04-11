//
//  OnboardingCoordinatorFactory.swift
//  Warehouse
//
//  Created by Алексей on 10.04.2024.
//

import Foundation


protocol OnboardingCoordinatorFactoryProtocol {
    
    func makeLoginCoordinator(router: Router) -> Coordinator & LoginCoordinatorOutput
}


final class OnboardingCoordinatorFactory: OnboardingCoordinatorFactoryProtocol {
    
    func makeLoginCoordinator(router: Router) -> Coordinator & LoginCoordinatorOutput {
        return LoginCoordinator(
            router: router,
            moduleFactory: LoginModuleFactory()
        )
    }

}
