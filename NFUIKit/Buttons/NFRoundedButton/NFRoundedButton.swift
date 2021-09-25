import UIKit

open class NFRoundedButton: UIButton {
    
    private var style: NFButtonStyle?
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
    
    open func setStyle(_ style: NFRoundedButtonStyle) {
        setAttributedTitle(style.title, for: .normal)
        setBackgroundImage(style.background, for: .normal)
        setTitleColor(style.textColor, for: .normal)
    }
}
