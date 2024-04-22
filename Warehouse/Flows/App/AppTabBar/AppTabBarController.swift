import UIKit


protocol AppTabBarControllerOutput: AnyObject {
    
    var makeOverviewFlow: ((UINavigationController) -> Void)? { get set }
    var makeSessionsFlow: ((UINavigationController) -> Void)? { get set }
    var makeProgressFlow: ((UINavigationController) -> Void)? { get set }
    var makeSettingsFlow: ((UINavigationController) -> Void)? { get set }
}

protocol AppTabBarControllerInput: AnyObject {
    func setSelectedIndex(to value: Int)
}

final class AppTabBarController: UITabBarController, TabBarController, AppTabBarControllerOutput {

    var makeOverviewFlow: ((UINavigationController) -> ())?
    var makeSessionsFlow: ((UINavigationController) -> ())?
    var makeProgressFlow: ((UINavigationController) -> ())?
    var makeSettingsFlow: ((UINavigationController) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let controller = customizableViewControllers?[selectedIndex] as? UINavigationController {
            makeOverviewFlow?(controller)
        }
    }
    
    private func configure() {
        let overviewItem = makeNavigationItem(
            title: "Overview",
            image: UIImage(systemName: "house"))
        
        let sessionsItem = makeNavigationItem(
            title: "Sessions",
            image: UIImage(systemName: "clock"))
        
        let progressItem = makeNavigationItem(
            title: "Progress",
            image: UIImage(systemName: "chart.bar.fill"))
        
        let settingsItem = makeNavigationItem(
            title: "Settings",
            image: UIImage(systemName: "gearshape"))
        
        setViewControllers([overviewItem, sessionsItem, progressItem, settingsItem], animated: true)
    }
    
    private func makeNavigationItem(title: String, image: UIImage?) -> UINavigationController {
        let navigation = UINavigationController()
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = image
        return navigation
    }
}

extension AppTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard
            let controller = viewControllers?[selectedIndex] as? UINavigationController,
            controller.viewControllers.isEmpty else { return }

        switch selectedIndex {
        case 0: makeOverviewFlow?(controller)
        case 1: makeSessionsFlow?(controller)
        case 2: makeProgressFlow?(controller)
        case 3: makeSettingsFlow?(controller)
        default: return
        }
    }
}

extension AppTabBarController: AppTabBarControllerInput {
    func setSelectedIndex(to value: Int) {
        selectedIndex = value
    }
}
