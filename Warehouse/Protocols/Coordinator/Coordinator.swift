import Foundation


protocol Coordinator: AnyObject {
    var coordinators: [Coordinator] { get set }
    func start()
    func start(with option: DeepLinkOption?)
    func add(_ coordinator: Coordinator?)
    func remove(_ coordinator: Coordinator?)
}

