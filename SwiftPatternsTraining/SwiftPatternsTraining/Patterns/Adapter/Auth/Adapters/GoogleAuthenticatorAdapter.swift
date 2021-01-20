import Foundation

class GoogleAuthenticatorAdapter: AuthenticationService {
    
    private var authenticator = GoogleAuthenticator()
    
    func login(email: String, password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void) {
        
        authenticator.login(email: email, password: password) { (currentUser, error) in
            guard let user = currentUser else {
                failure(error)
                return
            }
            
            let newUser = User(email: user.email, password: user.password)
            let token = Token(value: user.token)
            
            success(newUser, token)
        }
    }
}
