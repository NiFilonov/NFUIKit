import UIKit

class NFLabel: UIView {
    
    public var textMain: NSAttributedString {
        get {
            return mainLabel.attributedText ?? NSAttributedString(string: "")
        }
        set {
            mainLabel.attributedText = newValue
        }
    }
    
    public var textDescription: NSAttributedString {
        get {
            return descriptionLabel.attributedText ?? NSAttributedString(string: "")
        }
        set {
            descriptionLabel.attributedText = newValue
        }
    }
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = Metric.module
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        setupStackView()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.addArrangedSubview(mainLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
