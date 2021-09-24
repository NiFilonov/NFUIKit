import UIKit

public struct NFLITextFieldStyle {
    
    public init(
        lineColor: UIColor,
        iconStyle: NFStatesIconViewStyle
    ) {
        self.lineColor = lineColor
        self.iconStyle = iconStyle
    }
    
    var lineColor: UIColor
    
    var iconStyle: NFStatesIconViewStyle
    
}
