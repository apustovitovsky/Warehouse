import UIKit


struct Router {
    weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController?) {
        self.rootController = rootController
    }
    
    func push(_ controller: Presentable?) {
        guard
            let controller = controller?.toPresent(),
            !(controller is UINavigationController) else { return }
        
        rootController?.pushViewController(controller, animated: true)
    }
    
    func push(_ controller: Presentable?, animated: Bool, hideBottomBar: Bool) {
        guard
            let controller = controller?.toPresent(),
            !(controller is UINavigationController) else { return }
        
        controller.hidesBottomBarWhenPushed = hideBottomBar
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func present(_ controller: Presentable?) {
        guard let controller = controller?.toPresent() else { return }
        rootController?.present(controller, animated: true)
    }
    
    func dismiss(animated: Bool) {
        rootController?.dismiss(animated: animated)
    }
    
    func pop(animated: Bool) {
        rootController?.popViewController(animated: animated)
    }
    
    func setRoot(_ controller: Presentable?, hideBar: Bool) {
        guard let controller = controller?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRoot(animated: Bool) {
        rootController?.popToRootViewController(animated: animated)
    }
}
