import Foundation
import UIKit
import RxSwift
import RxCocoa

class ValidationView: UIView {

}

extension Reactive where Base: ValidationView {
  var isValid: Binder<Bool> {
    return Binder(self.base) { view, valid in
      view.backgroundColor = valid ? .green : .red
    }
  }
}
