import UIKit

public struct NFRoundedButtonStyle {
    
    public init(
        title: NSAttributedString,
        background: UIImage,
        textColor: UIColor
    ) {
        self.title = title
        self.background = background
        self.textColor = textColor
    }
    
    var title: NSAttributedString
    
    var background: UIImage
    
    var textColor: UIColor
    
}
