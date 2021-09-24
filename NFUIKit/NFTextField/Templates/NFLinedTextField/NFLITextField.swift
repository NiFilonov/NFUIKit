import UIKit

// LI - Lined + Icon

class NFLITextField: UIView {
    
    enum State {
        case active
        case inactive
    }
    
    private lazy var iconView: NFStatesIconView = {
        let iconView = NFStatesIconView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private lazy var textField: NFTextField = {
        let textField = NFTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var state: State = .inactive
    
    private var currentIcon: UIImage? {
        switch state {
        case .active:
            return activeIcon
        case .inactive:
            return inactiveIcon
        }
    }
    
    private var activeIcon: UIImage?
    
    private var inactiveIcon: UIImage?
    
    func setStyle(_ style: NFLITextFieldStyle) {
        iconView.setStyle(style.iconStyle)
        
        lineView.backgroundColor = style.lineColor
    }
    
}

// MARK: UI setup

extension NFLITextField {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        setupIconView()
        setupTextField()
        setupLineView()
    }
    
    private func setupIconView() {
        addSubview(iconView)
        
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 40.0),
            iconView.widthAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    private func setupTextField() {
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: Metric.module),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    private func setupLineView() {
        addSubview(lineView)
        
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.topAnchor.constraint(equalTo: textField.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 2.0)
        ])
    }
    
}

// MARK: TextFields interactions

extension NFLITextField {
    
    public func setText(_ text: NSAttributedString) {
        textField.setText(text)
    }
    
    public func setPlaceholder(_ placeholder: NSAttributedString) {
        textField.setPlaceholder(placeholder)
    }
    
}


extension NFLITextField: NFFormInputView {
    
    func getValue() -> String {
        return textField.text
    }
    
}
