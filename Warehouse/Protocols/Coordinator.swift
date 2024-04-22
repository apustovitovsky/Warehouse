import Foundation
import Combine


class Coordinator {
    var coordinators: [Coordinator] = []
    var deepLinkSubject = CurrentValueSubject<String?, Never>(nil)
    var deepLinkDisposeBag = Set<AnyCancellable>()
    var disposeBag = Set<AnyCancellable>()
    
    func start() {}
    func start(with option: String?) {}
    
    func add<T>(_ coordinator: T?) where T: Coordinator {
        guard !coordinators.contains(where: { $0 is T }) else { return }
        //guard !coordinators.contains(where: { $0 === coordinator }) else { return }
        if let coordinator {
            coordinators.append(coordinator)
            deepLinkSubject.subscribe(coordinator.deepLinkSubject).store(in: &deepLinkDisposeBag)
        }
    }
    
    func remove(_ coordinator: Coordinator?) {
        if let coordinator {
            coordinators = coordinators.filter{ $0 !== coordinator }
        }
    }
    
    func clear<T>(_: T.Type) where T: Coordinator {
        coordinators = coordinators.filter{ $0 is T }
    }
    
    func resetDeeplink() {
        coordinators.forEach { $0.deepLinkDisposeBag = Set<AnyCancellable>() }
        deepLinkSubject.send(nil)
    }
}

