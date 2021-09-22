import UIKit

protocol NFTextFieldDelegate: AnyObject {
    
}

public class NFTextField: UIView {
    
    weak var delegate: NFTextFieldDelegate?
    
    private lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.layer.masksToBounds = true
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var errorIconView: NFIconView = {
        let iconView = NFIconView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    public func setText(_ text: String) {
        textField.text = text
    }
    
    public func setStyle(_ style: NFTextFieldStyle) {
        textField.layer.cornerRadius = style.cornerRadius
        textField.layer.borderWidth = style.borderWidth
        textField.layer.borderColor = style.borderColor.cgColor
    }
    
    public func showError(_ message: String) {
        messageLabel.text = message
    }
    
    public func hideError() {
        messageLabel.text = .none
    }
    
    private func setupUI() {
        setupErrorIconView()
        setupTextField()
        setupMessageLabel()
    }
    
    private func setupErrorIconView() {
        addSubview(errorIconView)
        
        NSLayoutConstraint.activate([
            errorIconView.topAnchor.constraint(equalTo: topAnchor),
            errorIconView.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorIconView.widthAnchor.constraint(equalToConstant: 40.0),
            errorIconView.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    private func setupTextField() {
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.trailingAnchor.constraint(equalTo: errorIconView.leadingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    private func setupMessageLabel() {
        addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            messageLabel.topAnchor.constraint(equalTo: textField.bottomAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}


extension NFTextField: NFFormInputView {
    
    public func getValue() -> String {
        return textField.text ?? ""
    }
    
}
