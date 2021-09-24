import UIKit

protocol NFTextFieldDelegate: AnyObject {
    
}

public class NFTextField: UIView {
    
    weak var delegate: NFTextFieldDelegate?
    
    var text: String {
        return textField.attributedText?.string ?? ""
    }
    
    private lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.layer.masksToBounds = true
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    public func setText(_ text: NSAttributedString) {
        textField.attributedText = text
    }
    
    public func setPlaceholder(_ placeholder: NSAttributedString) {
        textField.attributedPlaceholder = placeholder
    }
    
    private func setupUI() {
        setupTextField()
    }
    
    private func setupTextField() {
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
}

extension NFTextField: NFFormInputView {
    
    public func getValue() -> String {
        return textField.text ?? ""
    }
    
}
