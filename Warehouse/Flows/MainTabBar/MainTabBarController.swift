//
//  MainTabBarController.swift
//  Warehouse
//
//  Created by Алексей on 08.04.2024.
//

import UIKit


protocol MainTabBarControllerProtocol: AnyObject {
    
    var onOverviewFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onSessionsFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onProgressFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onSettingsFlowSelect: ((UINavigationController) -> Void)? { get set }
}

final class MainTabBarController: UITabBarController, MainTabBarControllerProtocol {
    
    var onOverviewFlowSelect: ((UINavigationController) -> ())?
    var onSessionsFlowSelect: ((UINavigationController) -> ())?
    var onProgressFlowSelect: ((UINavigationController) -> ())?
    var onSettingsFlowSelect: ((UINavigationController) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onOverviewFlowSelect?(controller)
        }
        setupTabs()
    }
    
    private func setupTabs() {
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

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }

        switch selectedIndex {
        case 0: onOverviewFlowSelect?(controller)
        case 1: onSessionsFlowSelect?(controller)
        case 2: onProgressFlowSelect?(controller)
        case 3: onSettingsFlowSelect?(controller)
        default: return
        }
    }
}
