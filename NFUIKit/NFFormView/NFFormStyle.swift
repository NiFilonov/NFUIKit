import UIKit

public struct NFFormStyle {
    
    public init(
        backgroundColor: UIColor,
        textFieldStyle: NFTextFieldStyle
    ) {
        self.backgroundColor = backgroundColor
        self.textFieldStyle = textFieldStyle
    }
    
    var backgroundColor: UIColor
    
    var textFieldStyle: NFTextFieldStyle
}
