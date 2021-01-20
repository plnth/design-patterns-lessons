import UIKit

class AuthViewController: UIViewController {
    
    var authService = GoogleAuthenticatorAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        createUser(email: "mail@example.com", password: "")
    }
    
    func createUser(email: String, password: String) {
        authService.login(
            email: email,
            password: password,
            success: { (user, token) in
                debugPrint("auth completed: \(user.email), \(token.value)")
        },
            failure: { (error) in
                if let error = error {
                    debugPrint(error)
                }
        })
    }
}
