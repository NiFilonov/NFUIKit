import UIKit

public struct NFTextFieldStyle {
    
    public init(
        cornerRadius: CGFloat,
        borderWidth: CGFloat,
        borderColor: UIColor,
        textColor: UIColor
    ) {
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.textColor = textColor
    }
    
    var cornerRadius: CGFloat = 0.0
    
    var borderWidth: CGFloat = 0.0
    
    var borderColor: UIColor = .clear
    
    var textColor: UIColor = .black
    
}
