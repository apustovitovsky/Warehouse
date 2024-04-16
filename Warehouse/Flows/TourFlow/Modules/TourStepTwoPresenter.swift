import Foundation


protocol TourStepTwoModuleOutput: AnyObject {
    var finishTour: (() -> Void)? { get set }
}

protocol TourStepTwoPresenterInput: AnyObject {
    func finishTapped()
}

final class TourStepTwoPresenter: Presenter, TourStepTwoModuleOutput {
    
    weak var viewController: TourStepTwoViewControllerInput?
    var finishTour: (() -> Void)?
    
    init(viewController: TourStepTwoViewControllerInput?){
        self.viewController = viewController
    }
}

extension TourStepTwoPresenter: TourStepTwoPresenterInput {
    func finishTapped() {
        finishTour?()
    }
}
