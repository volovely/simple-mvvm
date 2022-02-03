import UIKit

class LoginViewController: UIViewController {

  var viewModel: LoginViewModel!

  @IBOutlet weak var txtEmai: UITextField!
  @IBOutlet weak var txtPassword: UITextField!
  @IBOutlet weak var btnSend: UIButton!
  @IBOutlet weak var emailValidationView: UIView!
  
  init() {
    super.init(nibName: String(describing: LoginViewController.self), bundle: .main)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
