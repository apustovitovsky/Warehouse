import Foundation


enum DeepLinkOption: String {
    case overview
    case sessions
    case programm
    case settings
    
    static func build(with dict: [String : AnyObject]?) -> DeepLinkOption? {
        //guard let id = dict?["launch_id"] as? String else { return nil }
        return .overview
    }
}
