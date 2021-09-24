import UIKit

public struct NFStatesIconViewStyle {
    
    public init(
        activeIcon: UIImage,
        inactiveIcon: UIImage
    ) {
        self.activeIcon = activeIcon
        self.inactiveIcon = inactiveIcon
    }
    
    var activeIcon: UIImage
    
    var inactiveIcon: UIImage
}
