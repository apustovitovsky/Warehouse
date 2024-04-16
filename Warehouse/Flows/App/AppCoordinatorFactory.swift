import Foundation


protocol AppCoordinatorFactoryProtocol {
    func makeTourCoordinator(with router: Router) -> Coordinator & TourCoordinatorOutput
    func makeAuthCoordinator(with router: Router) -> Coordinator & SignInCoordinatorOutput
    func makeMainTabBarCoordinator() -> (Presentable, Coordinator & AppTabBarCoordinatorOutput)
}


final class AppCoordinatorFactory: AppCoordinatorFactoryProtocol {
    
    func makeTourCoordinator(with router: Router) -> Coordinator & TourCoordinatorOutput {
        return TourCoordinator(
            router: router,
            moduleFactory: TourModuleFactory()
        )
    }
    
    func makeAuthCoordinator(with router: Router) -> Coordinator & SignInCoordinatorOutput {
        return SignInCoordinator(
            router: router,
            moduleFactory: SignInModuleFactory(),
            coordinatorFactory: SignInCoordinatorFactory()
        )
    }
    
    func makeMainTabBarCoordinator() -> (Presentable, Coordinator & AppTabBarCoordinatorOutput) {
        let controller = AppTabBarController()
        let coordinator = AppTabBarCoordinator(
            controller: controller,
            coordinatorFactory: AppTabBarCoordinatorFactory()
        )
        return (controller, coordinator)
    }
}
