//
//  SceneDelegate.swift
//  WorkoutApp
//
//  Created by Алексей on 29.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        if let window {
            let rootController = UINavigationController()
            coordinator = AppCoordinator(
                router: Router(rootController: rootController),
                coordinatorFactory: WelcomeScreenCoordinatorFactory(),
                moduleFactory: WelcomeScreenModuleFactory()
            )
            coordinator?.start()
            window.rootViewController = rootController
            window.makeKeyAndVisible()
        }
    }
    
}

