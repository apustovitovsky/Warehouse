import Foundation


protocol TourModuleFactoryProtocol {
    func makeTourStepOneModule(completion: ((TourStepOneModuleOutput) -> Void)?) -> Presentable
    func makeTourStepTwoModule(completion: ((TourStepTwoModuleOutput) -> Void)?) -> Presentable
}

final class TourModuleFactory: TourModuleFactoryProtocol {
    
    func makeTourStepOneModule(completion: ((TourStepOneModuleOutput) -> Void)?) -> Presentable {
        let viewController = TourStepOneViewController()
        let presenter = TourStepOnePresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }    
    
    func makeTourStepTwoModule(completion: ((TourStepTwoModuleOutput) -> Void)?) -> Presentable {
        let viewController = TourStepTwoViewController()
        let presenter = TourStepTwoPresenter(viewController: viewController)
        viewController.presenter = presenter
        completion?(presenter)
        return viewController
    }
}
