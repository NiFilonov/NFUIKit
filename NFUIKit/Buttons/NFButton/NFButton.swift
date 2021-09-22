import UIKit

open class NFButton: UIButton {
    
    private var style: NFButtonStyle?
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateUI()
    }
    
    open func setStyle(_ style: NFButtonStyle) {
        self.style = style
    }
    
    private func updateUI() {
        guard let style = style else {
            print("NFButton - style doesn't setted")
            return
        }
        titleLabel?.font = style.font
        backgroundColor = style.backgroundColor
        layer.cornerRadius = style.cornerRadius
        setTitleColor(style.textColor, for: .normal)
    }
    
}
