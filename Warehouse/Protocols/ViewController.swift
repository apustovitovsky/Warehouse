import UIKit


protocol ViewController: Presentable {
    associatedtype T
    var presenter: T? { get set }
}


