import UIKit


protocol Presenter {
    associatedtype T
    var viewController: T? { get set }
}





