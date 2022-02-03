import Foundation
import RxFlow
import UIKit

class LoginFlow: Flow {
  private let window: UIWindow

  var root: Presentable {
    return self.rootViewController
  }

  init(window: UIWindow) {
    self.window = window
  }

  private let rootViewController = UINavigationController()

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppStep else { return .none}

    switch step {
    case .loginIsRequired:
      return navigateToLogin()
    default:
      return .none
    }
  }

  private func navigateToLogin() -> FlowContributors {
    window.rootViewController = rootViewController

    let loginViewModel = LoginViewModel()
    let loginVc = LoginViewController()
    loginVc.viewModel = loginViewModel

    rootViewController.viewControllers = [loginVc]
    window.makeKeyAndVisible()
    return .one(
      flowContributor: .contribute(
        withNextPresentable: loginVc,
        withNextStepper: loginViewModel
      )
    )
  }
}
