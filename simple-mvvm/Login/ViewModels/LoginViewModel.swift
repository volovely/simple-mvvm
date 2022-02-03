import Foundation
import RxFlow
import RxRelay
import RxCocoa
import RxSwift

class LoginViewModel: ViewModel, Stepper {

  private let disposeBag = DisposeBag()

  let steps = PublishRelay<Step>()

  let input: Input
  let output: Output

  struct Input {
    let onEmailChanged: AnyObserver<String>
    let onPasswordChanged: AnyObserver<String>
  }

  struct Output {
    let isEmailValid: Driver<Bool>
    let isSendButtonEnabled: Driver<Bool>
  }

  // Input
  private let email = BehaviorSubject(value: "")
  private let password = BehaviorSubject(value: "")

  // Output
  private let isEmailValid = BehaviorSubject(value: true)
  private let isSendButtonEnabled = BehaviorSubject(value: false)

  init() {
    input = Input(
      onEmailChanged: email.asObserver(),
      onPasswordChanged: password.asObserver()
    )
    output = Output(
      isEmailValid: isEmailValid.asDriver(onErrorJustReturn: false),
      isSendButtonEnabled: isSendButtonEnabled.asDriver(onErrorJustReturn: false)
    )
  }
}
