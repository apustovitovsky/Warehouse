import Foundation


protocol TourStepOneModuleOutput: AnyObject {
    var goToNext: (() -> Void)? { get set }
    var skipTour: (() -> Void)? { get set }
}

protocol TourStepOnePresenterInput: AnyObject {
    func nextTapped()
    func skipTapped()
}

final class TourStepOnePresenter: Presenter, TourStepOneModuleOutput {
    
    weak var viewController: TourStepOneViewControllerInput?
    var goToNext: (() -> Void)?
    var skipTour: (() -> Void)?
    
    init(viewController: TourStepOneViewControllerInput?){
        self.viewController = viewController
    }
}

extension TourStepOnePresenter: TourStepOnePresenterInput {
    func nextTapped() {
        goToNext?()
    }
    
    func skipTapped() {
        skipTour?()
    }
}
