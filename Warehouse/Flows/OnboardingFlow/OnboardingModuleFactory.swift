//
//  OnboardingModuleFactory.swift
//  Warehouse
//
//  Created by Алексей on 10.04.2024.
//

import Foundation


protocol OnboardingModuleFactoryProtocol {

    func makeOnboardingModule(completion: ((OnboardingModuleOutput) -> Void)?) -> Module
}


final class OnboardingModuleFactory: OnboardingModuleFactoryProtocol {
    
    func makeOnboardingModule(completion: ((OnboardingModuleOutput) -> Void)?) -> Module {
        let viewController = OnboardingViewController()
        let presenter = OnboardingPresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
}
