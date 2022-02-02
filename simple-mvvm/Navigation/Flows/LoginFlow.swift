import Foundation
import RxFlow

class LoginFlow: Flow {
  var root: Presentable {
    return self.rootViewController
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
    let loginVc = LoginViewController()
    rootViewController.viewControllers = [loginVc]
    return .one(
      flowContributor: .contribute(
        withNextPresentable: loginVc,
        withNextStepper: OneStepper(withSingleStep: AppStep.loginIsRequired)
      )
    )
  }
}
