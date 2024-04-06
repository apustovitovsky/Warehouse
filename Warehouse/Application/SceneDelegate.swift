//
//  SceneDelegate.swift
//  WorkoutApp
//
//  Created by Алексей on 29.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        if let window {
            let rootController = UINavigationController()
            appCoordinator = .init(dependencies: .init(router: RouterBase(rootController: rootController)))
            appCoordinator?.start()
            window.rootViewController = rootController
            window.makeKeyAndVisible()
        }
    }
    
}

