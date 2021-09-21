import UIKit

class NFIconView: UIButton {
    
    var iconSideValue: CGFloat {
        get {
            return iconView.frame.height
        }
        set {
            iconViewHeight.constant = newValue
            iconViewWidth.constant = newValue
            layoutIfNeeded()
        }
    }
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var iconViewHeight: NSLayoutConstraint!
    
    private var iconViewWidth: NSLayoutConstraint!
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(iconView)
        
        iconViewWidth = NSLayoutConstraint(item: iconView,
                                            attribute: .width,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .width,
                                            multiplier: 1.0,
                                            constant: 64.0)
        iconViewHeight = NSLayoutConstraint(item: iconView,
                                            attribute: .height,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .height,
                                            multiplier: 1.0,
                                            constant: 64.0)
        NSLayoutConstraint.activate([
            iconViewWidth,
            iconViewHeight,
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
