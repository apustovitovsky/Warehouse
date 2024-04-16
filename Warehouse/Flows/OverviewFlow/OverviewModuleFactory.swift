import Foundation


protocol OverviewModuleFactoryProtocol {
    func makeOverviewModule(label: String, completion: ((OverviewModuleOutput) -> Void)?) -> Presentable
}

final class OverviewModuleFactory: OverviewModuleFactoryProtocol {
    
    func makeOverviewModule(label: String, completion: ((OverviewModuleOutput) -> Void)?) -> Presentable {
        let viewController = OverviewViewController(label: label)
        let presenter = OverviewPresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
}
