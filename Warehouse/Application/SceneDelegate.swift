import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private let rootController = UINavigationController()
    private lazy var router = Router(rootController: rootController)
    private lazy var coordinator = AppCoordinator(router: router, coordinatorFactory: AppCoordinatorFactory())
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.coordinator.start(with: "register")
        }
        coordinator.start(with: "login")

        self.handleContext(connectionOptions.urlContexts)
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        self.handleContext(URLContexts)
    }
}

extension SceneDelegate {
    private func handleContext(_ urlContexts: Set<UIOpenURLContext>) {
        
    }
}

