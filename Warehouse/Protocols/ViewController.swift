import UIKit


protocol ViewController: UIViewController {
    associatedtype T
    var presenter: T? { get set }
}


