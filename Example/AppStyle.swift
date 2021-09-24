import UIKit
import NFUIKit

class AppStyle {
    
    enum ViewControllerStyle {
        static var basic: NFViewControllerStyle {
            return NFViewControllerStyle(backgroundColor: .white)
        }
    }
    
    enum FormStyle {
        static var login: NFFormStyle {
            return NFFormStyle(backgroundColor: .clear)
        }
    }
    
    enum TextFieldStyle {
        static var formEmailTextField: NFLITextFieldStyle {
            return NFLITextFieldStyle(lineColor: UIColor(rgb: 0xf6f5f8),
                                      iconStyle: NFStatesIconViewStyle(activeIcon: UIImage(named: "envelope")!,
                                                                       inactiveIcon: UIImage(named: "envelope")!))
        }
        static var formPasswordTextField: NFLITextFieldStyle {
            return NFLITextFieldStyle(lineColor: UIColor(rgb: 0xf6f5f8),
                                      iconStyle: NFStatesIconViewStyle(activeIcon: UIImage(named: "password")!,
                                                                       inactiveIcon: UIImage(named: "password")!))
        }
    }
    
    enum ButtonStyle {
        static var main: NFButtonStyle {
            return NFButtonStyle(font: .systemFont(ofSize: 15.0, weight: .bold),
                                   backgroundColor: .blue,
                                   cornerRadius: 16.0,
                                   textColor: .white)
        }
        
        static var cancel: NFButtonStyle {
            return NFButtonStyle(font: .systemFont(ofSize: 12.0, weight: .bold),
                                   backgroundColor: .black,
                                   cornerRadius: 16.0,
                                   textColor: .yellow)
        }
    }
    
}

extension String {
    
    var mainTitle: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 42.0, weight: .black)])
    }
    
    var descriptionTitle: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.foregroundColor: UIColor.lightGray, .font: UIFont.systemFont(ofSize: 18.0, weight: .black)])
    }
    
}
