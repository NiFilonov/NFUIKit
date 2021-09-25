import UIKit

public struct NFFormStyle {
    
    public init(
        backgroundColor: UIColor,
        buttonStyle: NFRoundedButtonStyle
    ) {
        self.backgroundColor = backgroundColor
        self.buttonStyle = buttonStyle
    }
    
    var backgroundColor: UIColor
    
    var buttonStyle: NFRoundedButtonStyle
}
