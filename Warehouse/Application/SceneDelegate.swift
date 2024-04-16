import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        if let window {
            let rootController = UINavigationController()
            coordinator = AppCoordinator(
                router: Router(rootController: rootController),
                coordinatorFactory: AppCoordinatorFactory()
            )
            coordinator?.start()
            window.rootViewController = rootController
            window.makeKeyAndVisible()
        }
        
        //MARK: Handle context when the app is terminated.
        self.handleContext(connectionOptions.urlContexts)
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        //MARK: Handle context when the app is in background.
        self.handleContext(URLContexts)
    }
}

extension SceneDelegate {
    //MARK:
    private func handleContext(_ urlContexts: Set<UIOpenURLContext>) {
        if let url = urlContexts.first?.url {
            
            print(url)
            
            let urlString = url.absoluteString
            
            let component = urlString.components(separatedBy: "=")

            print(component)

            if component.count > 1, let product = component.last {

                print(product)
            }
        }
    }
}

