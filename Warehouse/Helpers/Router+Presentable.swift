import UIKit


extension Router: Presentable {
    func toPresent() -> UIViewController? {
        return rootController
    }
}
