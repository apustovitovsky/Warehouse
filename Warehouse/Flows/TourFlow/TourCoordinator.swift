import Foundation


protocol TourCoordinatorOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}


final class TourCoordinator: Coordinator, TourCoordinatorOutput {
    
    var finishFlow: (() -> Void)?

    private let router: Router
    private let moduleFactory: TourModuleFactoryProtocol
    
    init(router: Router,
         moduleFactory: TourModuleFactoryProtocol) {

        self.router = router
        self.moduleFactory = moduleFactory
    }
    
    override func start() {
        showTourStepOneModule()
    }
    
    override func start(with option: String?) {
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
