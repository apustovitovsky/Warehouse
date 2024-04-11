import Foundation


class Coordinator {
    
    private var coordinators: [Coordinator] = []

    func start() {}
    
    func add(_ coordinator: Coordinator?) {
        guard !coordinators.contains(where: { $0 === coordinator }) else { return }
        
        if let coordinator {
            coordinators.append(coordinator)
        }
    }
    
    func remove(_ coordinator: Coordinator?) {
        if let coordinator {
            coordinators = coordinators.filter{ $0 !== coordinator }
        }
    }
}
