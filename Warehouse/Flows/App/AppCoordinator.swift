import UIKit
import Combine


final class AppCoordinator: Coordinator {
    
    private let router: Router
    private let coordinatorFactory: AppCoordinatorFactoryProtocol
    
    private var isAuthenticated: Bool = true
    private var isTourCompleted: Bool = true
    
    init(router: Router,
         coordinatorFactory: AppCoordinatorFactoryProtocol) {
        
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        super.init()
        
        bindDeepLink()
    }
    
    func bindDeepLink() {
        deepLinkSubject
            .unwrap()
            .map(AppFlow.init(deeplink:))
            .unwrap()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] deeplink in
                guard let self else { return }
                switch deeplink {
                case .auth: self.showAuth()
                case .home: self.showMain()
                }
                self.resetDeeplink()
            }
            .store(in: &disposeBag)
    }
    
    override func start() {
    }
    
    override func start(with option: String?) {
        deepLinkSubject.send(option)
    }
}


private extension AppCoordinator {
    
    func showTour() {
        let coordinator = coordinatorFactory.makeTourCoordinator(with: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.isTourCompleted = true
            self?.start()
            self?.remove(coordinator)
        }
        add(coordinator)
        coordinator.start()
    }
    
    func showAuth() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(with: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.isAuthenticated = true
            self?.start()
            self?.remove(coordinator)
        }
        add(coordinator)
        print(coordinators.count)
    }
    
    func showMain() {
        let (module, coordinator) = AppCoordinatorFactory().makeMainTabBarCoordinator()
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.isAuthenticated = false
            self?.start()
            self?.remove(coordinator)
        }
        add(coordinator)
        router.setRoot(module, hideBar: true)
        coordinator.start()
    }
}
