import Foundation


struct User {
    let username: String
    let password: String
    
    init(username: String, password: String = "") {
        self.username = username
        self.password = password
    }
}
