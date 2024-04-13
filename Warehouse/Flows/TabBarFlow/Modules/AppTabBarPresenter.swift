//import Foundation
//
//
//protocol AppTabBarModuleOutput: AnyObject {
//    
//    var toOverview: (() -> Void)? { get set }
//    var toSessions: (() -> Void)? { get set }
//}
//
//protocol AppTabBarPresenterInput: AnyObject {
//    
//    func selectTab(selectedIndex: Int)
//}
//
//
//final class AppTabBarPresenter<T: AppTabBarControllerInput>: Presenter<T>, AppTabBarModuleOutput {
//    
//    var toOverview: (() -> Void)?
//    var toSessions: (() -> Void)?
//}
//
//
//extension AppTabBarPresenter: AppTabBarPresenterInput {
//    
//    func selectTab(selectedIndex: Int) {
//        switch selectedIndex {
//        case 0: 
//            toOverview?()
//        default: 
//            toSessions?()
//        }
//    }
//}
