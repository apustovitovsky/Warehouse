import Foundation


protocol OverviewCoordinatorOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}


final class OverviewCoordinator: Coordinator, OverviewCoordinatorOutput {

    var finishFlow: (() -> Void)?

    private let label: String
    private let router: Router
    private let moduleFactory: OverviewModuleFactoryProtocol
    
    init(label: String,
         router: Router,
         moduleFactory: OverviewModuleFactoryProtocol) {

        self.label = label
        self.router = router
        self.moduleFactory = moduleFactory
    }
    
    override func start() {
        showOverviewModule()
    }
    
    override func start(with option: String?) {
    }
}

private extension OverviewCoordinator {
    
    func showOverviewModule() {
        let module = moduleFactory.makeOverviewModule(label: label) { [weak self] output in
            
            output.finishModule = {
                self?.finishFlow?()
            }
        }
        router.push(module)
    }
}
