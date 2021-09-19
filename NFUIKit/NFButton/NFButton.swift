import UIKit

open class NFButton: UIButton {
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateUI()
    }
    
    open func makeStyle() -> NFButtonStyle? {
        return nil
    }
    
    private func updateUI() {
        guard let style = makeStyle() else {
            print("NFButton - style doesn't setted")
            return
        }
        titleLabel?.font = style.font
        backgroundColor = style.backgroundColor
        layer.cornerRadius = style.cornerRadius
        setTitleColor(style.textColor, for: .normal)
    }
    
}
