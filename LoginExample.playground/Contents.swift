//: Playground - noun: a place where people can play

import UIKit

struct LoginUser {
  let email: String
  let password: String
  func isValide() -> Bool {
    return email != "" && password != ""
  }
}

enum LoginProvider {
  case Facebook
  case Twitter
  case Google
  case Email(LoginUser)
  func login(delegate: LoginProviderDelegate) {
    switch self {
    case let .Email(user) where user.isValide():
      //login
      print("email login")
      break
    case .Facebook:
      //facebook login
      break
    case .Twitter:
      //twitter login
      break
    case .Google:
      //google login
      break
    default:
      print("not mutch anything")
    }
  }
}

protocol LoginProviderDelegate {
  func loginProvider(loginProvider: LoginProvider, didSucceed user: LoginUser)
  func loginProvider(lginProvider: LoginProvider, didError error: NSError)
}

class ViewController: UIViewController, LoginProviderDelegate {
  var provider = LoginProvider.Facebook
  
  @IBAction func loginDidTouch() {
    provider.login(self)
  }
  
  func loginProvider(loginProvider: LoginProvider, didSucceed user: LoginUser) {
    print(user)
  }
  func loginProvider(lginProvider: LoginProvider, didError error: NSError) {
    print("test")
  }
}
