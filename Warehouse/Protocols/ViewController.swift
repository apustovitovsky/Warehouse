import Foundation


protocol ViewController: Presentable {
    associatedtype T
    var presenter: T? { get set }
}


