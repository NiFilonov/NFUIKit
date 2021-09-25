import UIKit

public typealias NFFormInputItem = (name: String, view: NFFormInputView)

public class NFFormView: UIView {
    
    public var inputedData: [String: String] {
        return Dictionary(uniqueKeysWithValues: items.map({ ($0.name, $0.view.getValue()) }))
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .trailing
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var actionButton: NFRoundedButton = {
        let button = NFRoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var items: [NFFormInputItem] = []
    
    public override func layoutSubviews() {
        setupUI()
    }
    
    public func setStyle(_ style: NFFormStyle) {
        backgroundColor = style.backgroundColor
        
        actionButton.setStyle(style.buttonStyle)
    }
    
    public func addInputViews(_ inputViews: [NFFormInputItem]) {
        items = inputViews
        inputViews.forEach({
            self.stackView.addArrangedSubview($0.view)
        })
        self.stackView.addArrangedSubview(actionButton)
    }
    
    private func setupUI() {
        setupContentView()
        setupStackView()
    }
    
    private func setupContentView() {
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupStackView() {
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .zero),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .zero)
        ])
    }
    
}
