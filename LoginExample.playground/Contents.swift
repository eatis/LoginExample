//: Playground - noun: a place where people can play

import XCPlayground
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
      delegate.loginProvider(self, didSucceed: user)
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
  let subView = UIView()
  
  func showView() {
    subView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
    subView.backgroundColor = .redColor()
    XCPlaygroundPage.currentPage.liveView = subView
    view.addSubview(subView)
    
    view.backgroundColor = .blueColor()
  }
  //  override func loadView() {
  //    subView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
  //    subView.backgroundColor = .redColor()
  //    XCPlaygroundPage.currentPage.liveView = subView
  //    view.addSubview(subView)
  //  }
  
  func loginDidTouch() {
    let user = LoginUser(email: "email@test.com", password: "testpass")
    provider = .Email(user)
    provider.login(self)
  }
  
  func loginProvider(loginProvider: LoginProvider, didSucceed user: LoginUser) {
    print(user)
    print(user.email)
  }
  func loginProvider(lginProvider: LoginProvider, didError error: NSError) {
    print("test")
  }
}


let loginView = ViewController()
loginView.loginDidTouch()
loginView.showView()
XCPlaygroundPage.currentPage.liveView = loginView

//let subView = UIView()
//subView.backgroundColor = .redColor()
//XCPlaygroundPage.currentPage.liveView = subView
