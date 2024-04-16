import UIKit


protocol AppTabBarCoordinatorFactoryProtocol {
    func makeOverviewFlow(navController: UINavigationController) -> Coordinator & OverviewCoordinatorOutput
    func makeSessionsFlow(navController: UINavigationController) -> Coordinator & OverviewCoordinatorOutput
    func makeProgressFlow(navController: UINavigationController) -> Coordinator & OverviewCoordinatorOutput
    func makeSettingsFlow(navController: UINavigationController) -> Coordinator & OverviewCoordinatorOutput
}


final class AppTabBarCoordinatorFactory: AppTabBarCoordinatorFactoryProtocol {
    
    func makeOverviewFlow(navController: UINavigationController) -> Coordinator & OverviewCoordinatorOutput {
        return OverviewCoordinator(
            label: "Overview",
            router: Router(rootController: navController),
            moduleFactory: OverviewModuleFactory()
        )
    }
    
    func makeSessionsFlow(navController: UINavigationController) -> Coordinator & OverviewCoordinatorOutput  {
        return OverviewCoordinator(
            label: "Sessions",
            router: Router(rootController: navController),
            moduleFactory: OverviewModuleFactory()
        )
    }
    
    func makeProgressFlow(navController: UINavigationController) -> Coordinator & OverviewCoordinatorOutput  {
        return OverviewCoordinator(
            label: "Progress",
            router: Router(rootController: navController),
            moduleFactory: OverviewModuleFactory()
        )
    }
    
    func makeSettingsFlow(navController: UINavigationController) -> Coordinator & OverviewCoordinatorOutput  {
        return OverviewCoordinator(
            label: "Settings",
            router: Router(rootController: navController),
            moduleFactory: OverviewModuleFactory()
        )
    }
}
