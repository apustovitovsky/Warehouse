import Foundation


protocol Coordinator: AnyObject {
    var coordinators: [Coordinator] { get set }
    func start()
    func add(_ coordinator: Coordinator?)
    func remove(_ coordinator: Coordinator?)
}

