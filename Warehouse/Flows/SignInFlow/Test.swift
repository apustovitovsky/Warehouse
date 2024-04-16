//import UIKit
//
//
//protocol MyCoordinatorOutput: AnyObject {
//    var finishFlow: (() -> Void)? { get set }
//}
//
//final class MyCoordinator: Coordinator, MyCoordinatorOutput {
//    
//    var finishFlow: (() -> Void)?
//    
//    private let navController: UINavigationController
//    private let moduleFactory: MyModuleFactoryProtocol
//
//    
//    init(navController: UINavigationController,
//         moduleFactory: MyModuleFactoryProtocol) {
//
//        self.navController = navController
//        self.moduleFactory = moduleFactory
//    }
//    
//    func start() {
//        showEnterUsername()
//    }
//}
//
//private extension MyCoordinator {
//    
//    func showEnterUsername() {
//        let viewController: UIViewController = moduleFactory.makeEnterUsernameController()
//            
//        viewController.finishModule = { [weak self] in
//            self?.showEnterPassword()
//        }
//
//        navController.setViewControllers([viewController], animated: true)
//    }
//    
//    func showEnterPassword() {
//        let viewController: UIViewController = moduleFactory.makeEnterPasswordController()
//            
//        viewController.finishModule = { [weak self] in
//            self?.showEnterAge()
//        }
//
//        navController.pushViewController(viewController, animated: true)
//    }
//    
//    func showEnterAge() {
//        let viewController: UIViewController = moduleFactory.makeEnterAgeController()
//            
//        viewController.finishModule = { [weak self] in
//            self?.showSignUpSuccess()
//        }
//
//        navController.pushViewController(viewController, animated: true)
//    }
//    
//    func showSignUpSuccess() {
//        let viewController: UIViewController = moduleFactory.makeSuccessController()
//            
//        viewController.finishModule = { [weak self] in
//            self?.finishFlow?()
//        }
//        
//        viewController.enterPasswordAgain = { [weak self] in
//            //TODO: Back to showEnterPassword
//        }
//
//        navController.pushViewController(viewController, animated: true)
//    }
//}
