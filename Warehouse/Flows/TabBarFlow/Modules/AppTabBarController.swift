//import UIKit
//
//
//protocol AppTabBarControllerInput: AnyObject {
//    
//}
//
//final class AppTabBarController: UITabBarController {
//    
//    var presenter: AppTabBarPresenterInput?
//    
//    struct TabBarItem {
//        let title: String
//        let image: UIImage?
//    }
//    
//    private func setupTabs() {
//        let controllers = [
//            TabBarItem(title: "Overview", image: UIImage(systemName: "house")),
//            TabBarItem(title: "Sessions", image: UIImage(systemName: "clock")),
//            TabBarItem(title: "Progress", image: UIImage(systemName: "chart.bar.fill")),
//            TabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"))
//        ].map { element in
//            let navigation = UINavigationController()
//            navigation.tabBarItem.title = element.title
//            navigation.tabBarItem.image = element.image
//            return navigation
//        }
//        setViewControllers(controllers, animated: true)
//    }
//}
//
//extension AppTabBarController: AppTabBarControllerInput {
//    
//}
//
//extension AppTabBarController: UITabBarControllerDelegate {
//    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        guard 
//            let navController = viewController as? UINavigationController,
//            navController.viewControllers.isEmpty
//        else { return }
//        presenter?.selectTab(selectedIndex: selectedIndex)
//    }
//}
//
//
//
