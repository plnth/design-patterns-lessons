import Foundation

public struct GoogleUser {
    public var email: String
    public var password: String
    public var token: String
}

public class GoogleAuthenticator {
    public func login(email: String, password: String, completion: @escaping (GoogleUser?, Error?) -> Void) {
        
        let token = "veryveryveryveryverylongtoken"
        let user = GoogleUser(email: email, password: password, token: token)
        completion(user, nil)
    }
}
