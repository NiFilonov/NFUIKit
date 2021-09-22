import UIKit

public typealias NFFormInputItem = (name: String, view: NFFormInputView)

public class NFFormView: UIView {
    
    public var inputedData: [String: String] {
        return Dictionary(uniqueKeysWithValues: items.map({ ($0.name, $0.view.getValue()) }))
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var items: [NFFormInputItem] = []
    
    public override func layoutSubviews() {
        setupUI()
    }
    
    public func setStyle(_ style: NFFormStyle) {
        backgroundColor = style.backgroundColor
    }
    
    public func addInputViews(_ inputViews: [NFFormInputItem]) {
        items = inputViews
        inputViews.forEach({
            self.stackView.addArrangedSubview($0.view)
        })
    }
    
    public func addInputView(_ inputView: NFFormInputItem) {
        items.append(inputView)
        stackView.addArrangedSubview(inputView.view)
    }
    
    private func setupUI() {
        setupStackView()
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
