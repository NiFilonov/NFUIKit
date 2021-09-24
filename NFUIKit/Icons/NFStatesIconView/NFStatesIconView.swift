import UIKit

class NFStatesIconView: UIView {
    
    enum State {
        case inactive
        case active
    }
    
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
    
    private var state: State = .inactive
    
    private var inactiveIcon: UIImage?
    
    private var activeIcon: UIImage?
    
    private var currentImage: UIImage? {
        switch state {
        case .inactive:
            return inactiveIcon
        case .active:
            return activeIcon
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    func setStyle(_ style: NFStatesIconViewStyle) {
        self.inactiveIcon = style.inactiveIcon
        self.activeIcon = style.activeIcon
        updateIcon()
    }
    
    func changeState(to state: State) {
        self.state = state
        updateIcon()
    }
    
    private func setupConstraints() {
        addSubview(iconView)
        
        iconViewWidth = NSLayoutConstraint(item: iconView,
                                            attribute: .width,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .width,
                                            multiplier: 1.0,
                                            constant: 24.0)
        iconViewHeight = NSLayoutConstraint(item: iconView,
                                            attribute: .height,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .height,
                                            multiplier: 1.0,
                                            constant: 24.0)
        NSLayoutConstraint.activate([
            iconViewWidth,
            iconViewHeight,
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func updateIcon() {
        iconView.image = currentImage
    }
    
}
