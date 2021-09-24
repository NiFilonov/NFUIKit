import UIKit

public struct NFRoundedButtonStyle {
    
    public init(
        title: NSAttributedString,
        background: NFImageConvertableObject,
        textColor: UIColor
    ) {
        self.title = title
        self.background = background
        self.textColor = textColor
    }
    
    var title: NSAttributedString
    
    var background: NFImageConvertableObject
    
    var textColor: UIColor
    
}
