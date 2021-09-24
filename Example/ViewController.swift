import UIKit
import NFUIKit

class ViewController: NFViewController {
    
    @IBOutlet weak var button: ButtonCancel!
    @IBOutlet weak var textField: NFTextField!
    @IBOutlet weak var form: NFFormView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setStyle(AppStyle.ButtonStyle.cancel)
        button.addTarget(self, action: #selector(showLogin), for: .touchUpInside)
    }
    
    @objc func showLogin() {
        let login = NFViewController.Templates
            .loginViewController(with: AppStyle.ViewControllerStyle.basic,
                                 formStyle: AppStyle.FormStyle.login,
                                 buttonStyle: AppStyle.ButtonStyle.cancel,
                                 emailTextFieldStyle: AppStyle.TextFieldStyle.formEmailTextField,
                                 passwordTextFieldStyle: AppStyle.TextFieldStyle.formPasswordTextField,
                                 mainTitleText: "Login".mainTitle,
                                 descriptionTitleText: "Please sign in to continue".descriptionTitle,
                                 placeholderFont: UIFont.systemFont(ofSize: 14.0, weight: .black),
                                 placeholderColor: .lightGray)
        navigationController?.pushViewController(login, animated: true)
    }
    
}
