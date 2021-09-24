import UIKit

public protocol NFImageConvertableObject {
    var image: UIImage { get }
}

extension CALayer: NFImageConvertableObject {
    
    public var image: UIImage {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, self.isOpaque, 0)
        self.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }
    
}
