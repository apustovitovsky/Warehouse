////
////  MainTabBar.swift
////  Warehouse
////
////  Created by Алексей on 08.04.2024.
////
//
//import UIKit
//
//
//final class AppTabBarCoordinator: Coordinator {
//    
//    var coordinators: [Coordinator] = []
//    private let controller: MainTabBarControllerProtocol
//    private let coordinatorFactory: MainTabBarCoordinatorFactoryProtocol
//    
//    init(controller: MainTabBarControllerProtocol,
//         coordinatorFactory: MainTabBarCoordinatorFactoryProtocol) {
//        self.controller = controller
//        self.coordinatorFactory = coordinatorFactory
//    }
//    
//    func start() {
//        let tabBar = AppTabBarController()
//        let presenter = AppTabBarPresenter(viewController: tabBar)
//        
////        presenter.toOverview = {
////            let coordinator = self?.coordinatorFactory.makeSettingsFlow(navController: navController)
////            self?.add(coordinator)
////            coordinator?.start()
////        }
////        
////        presenter.toSessions = {
////  
////        }
//    }
//    
////    private func runOverviewFlow() -> ((UINavigationController) -> Void) {
////
////    }
////    
////    private func runSessionsFlow() -> ((UINavigationController) -> ()) {
////
////    }
////    
////    private func runProgressFlow() -> ((UINavigationController) -> ()) {
////        
////    }
////    
////    private func runSettingsFlow() -> ((UINavigationController) -> ()) {
////        return { [weak self] navController in
////            if navController.viewControllers.isEmpty {
////                let coordinator = self?.coordinatorFactory.makeSettingsFlow(navController: navController)
////                self?.add(coordinator)
////                coordinator?.start()
////            }
////        }
////    }
//}
