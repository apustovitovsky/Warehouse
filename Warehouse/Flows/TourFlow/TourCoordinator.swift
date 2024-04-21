import Foundation


protocol TourCoordinatorOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}


final class TourCoordinator: Coordinator, TourCoordinatorOutput {
    
    var coordinators: [Coordinator] = []
    var finishFlow: (() -> Void)?

    private let router: Router
    private let moduleFactory: TourModuleFactoryProtocol
    
    init(router: Router,
         moduleFactory: TourModuleFactoryProtocol) {

        self.router = router
        self.moduleFactory = moduleFactory
    }
    
    func start() {
        showTourStepOneModule()
    }
    
    func start(with option: DeepLinkOption?) {
    }
}


private extension TourCoordinator {
    
    func showTourStepOneModule() {
        let module = moduleFactory.makeTourStepOneModule { [weak self] output in
            
            output.goToNext = {
                self?.showTourStepTwoModule()
            }

            output.skipTour = {
                self?.finishFlow?()
            }
        }
        router.setRoot(module, hideBar: false)
    }
    
    func showTourStepTwoModule() {
        let module = moduleFactory.makeTourStepTwoModule { [weak self] output in
            
            output.finishTour = {
                self?.finishFlow?()
            }
        }
        router.push(module)
    }
}
