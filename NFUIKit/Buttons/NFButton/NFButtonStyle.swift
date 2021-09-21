import UIKit

public struct NFButtonStyle {
    
    public init(
        font: UIFont,
        backgroundColor: UIColor,
        cornerRadius: CGFloat,
        textColor: UIColor
    ) {
        self.font = font
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.textColor = textColor
    }
    
    var font: UIFont
    
    var backgroundColor: UIColor
    
    var cornerRadius: CGFloat
    
    var textColor: UIColor

}
