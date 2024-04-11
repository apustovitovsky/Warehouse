import UIKit


class Presenter<ViewType: AnyObject> {
    weak var viewController: ViewType?
    
    init(viewController: ViewType?) {
        self.viewController = viewController
    }
}


extension Presenter: Module where ViewType: UIViewController {
    func toPresent() -> UIViewController? {
        return viewController
    }
}




