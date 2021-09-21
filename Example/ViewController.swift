import NFUIKit

class ViewController: NFViewController {

    @IBOutlet weak var button: ButtonCancel!
    @IBOutlet weak var textField: NFTextField!
    
    override func viewDidLoad() {
        textField.showError("Some error")
        textField.setStyle(NFTextFieldStyle(cornerRadius: 18.0,
                                            borderWidth: 1.0,
                                            borderColor: .gray,
                                            textColor: .black))
    }
    
}

