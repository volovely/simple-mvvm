import Foundation
import RxFlow

enum AppStep: Step {
  // Login
  case loginIsRequired
  case userIsLoggedIn
}
