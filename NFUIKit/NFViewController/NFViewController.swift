import UIKit

open class NFViewController: UIViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        hideKeyboardWhenTappedAround()
    }
    
    public func setStyle(_ style: NFViewControllerStyle) {
        view.backgroundColor = style.backgroundColor
    }
    
    open func setupStyle() {
        
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
