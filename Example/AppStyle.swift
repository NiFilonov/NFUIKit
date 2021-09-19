import UIKit
import NFUIKit

class AppStyle {
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
