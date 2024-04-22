import Foundation
import Combine


enum AppFlow: String {
    case home
    case auth
    
    init?(deeplink: String) {
        if let flow = AppFlow(rawValue: deeplink) {
            self = flow
            return
        }

        if HomeFlow(deeplink: deeplink) != nil {
            self = .home
        } else if AuthFlow(deeplink: deeplink) != nil {
            self = .auth
        } else {
            return nil
        }
    }
}

enum HomeFlow: String {
    case overview
    case sessions
    case progress
    case settings

    init?(deeplink: String) {
        if let flow = HomeFlow(rawValue: deeplink) {
            self = flow
            return
        }
        return nil
    }
}

enum AuthFlow: String {
    case login
    case register

    init?(deeplink: String) {
        if let flow = AuthFlow(rawValue: deeplink) {
            self = flow
            return
        }
        return nil
    }
}
