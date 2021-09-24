import UIKit

extension NFViewController {
    
    public enum Templates {
        
        public static func loginViewController(with viewControllerStyle: NFViewControllerStyle,
                                     formStyle: NFFormStyle,
                                     buttonStyle: NFButtonStyle,
                                     emailTextFieldStyle: NFLITextFieldStyle,
                                     passwordTextFieldStyle: NFLITextFieldStyle,
                                     mainTitleText: NSAttributedString,
                                     descriptionTitleText: NSAttributedString,
                                     placeholderFont: UIFont,
                                     placeholderColor: UIColor) -> NFLoginViewController {
            return NFLoginViewController(viewControllerStyle: viewControllerStyle,
                                         formStyle: formStyle,
                                         buttonStyle: buttonStyle,
                                         emailTextFieldStyle: emailTextFieldStyle,
                                         passwordTextFieldStyle: passwordTextFieldStyle,
                                         mainTitleText: mainTitleText,
                                         descriptionTitleText: descriptionTitleText,
                                         placeholderFont: placeholderFont,
                                         placeholderColor: placeholderColor)
        }
        
        public class NFLoginViewController: NFViewController {
            
            private lazy var titleLabel: NFLabel = {
                let label = NFLabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            private lazy var formView: NFFormView = {
                let formView = NFFormView()
                formView.translatesAutoresizingMaskIntoConstraints = false
                return formView
            }()
            
            private lazy var loginButton: NFButton = {
                let button = NFButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                return button
            }()
            
            private var viewControllerStyle: NFViewControllerStyle
            private var formStyle: NFFormStyle
            private var buttonStyle: NFButtonStyle
            private var emailTextFieldStyle: NFLITextFieldStyle
            private var passwordTextFieldStyle: NFLITextFieldStyle
            private var mainTitleText: NSAttributedString
            private var descriptionTitleText: NSAttributedString
            private var placeholderFont: UIFont
            private var placeholderColor: UIColor
            
            fileprivate init(viewControllerStyle: NFViewControllerStyle,
                 formStyle: NFFormStyle,
                 buttonStyle: NFButtonStyle,
                 emailTextFieldStyle: NFLITextFieldStyle,
                 passwordTextFieldStyle: NFLITextFieldStyle,
                 mainTitleText: NSAttributedString,
                 descriptionTitleText: NSAttributedString,
                 placeholderFont: UIFont,
                 placeholderColor: UIColor) {
                
                self.viewControllerStyle = viewControllerStyle
                self.formStyle = formStyle
                self.buttonStyle = buttonStyle
                self.emailTextFieldStyle = emailTextFieldStyle
                self.passwordTextFieldStyle = passwordTextFieldStyle
                self.mainTitleText = mainTitleText
                self.descriptionTitleText = descriptionTitleText
                self.placeholderFont = placeholderFont
                self.placeholderColor = placeholderColor
                
                super.init(nibName: nil, bundle: nil)
            }
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
            
            public override func viewDidLoad() {
                super.viewDidLoad()
                setupUI()
            }
            
            private func setupUI() {
                setupLoginButton()
                setupFormView()
                setupTitleLabel()
                
                setupStyles()
            }
            
            private func setupStyles() {
                setStyle(viewControllerStyle)
                formView.setStyle(formStyle)
                loginButton.setStyle(buttonStyle)
                titleLabel.textMain = mainTitleText
                titleLabel.textDescription = descriptionTitleText
            }
            
            private func setupTitleLabel() {
                view.addSubview(titleLabel)
                
                NSLayoutConstraint.activate([
                    titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.tripleModule),
                    titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metric.tripleModule),
                    titleLabel.bottomAnchor.constraint(equalTo: formView.topAnchor, constant: -Metric.largeSpacing)
                ])
            }
            
            private func setupFormView() {
                view.addSubview(formView)
                let mailTextField = NFLITextField(frame: .zero)
                mailTextField.setStyle(emailTextFieldStyle)
                mailTextField.setPlaceholder(NSAttributedString(string: "Email", attributes: [.foregroundColor: placeholderColor, .font: placeholderFont]))
                
                let passwordTextField = NFLITextField(frame: .zero)
                passwordTextField.setStyle(passwordTextFieldStyle)
                passwordTextField.setPlaceholder(NSAttributedString(string: "Password", attributes: [.foregroundColor: placeholderColor, .font: placeholderFont]))
                
                formView.addInputViews([NFFormInputItem(name: "email",
                                                        view: mailTextField),
                                        NFFormInputItem(name: "password",
                                                        view: passwordTextField)])
                
                NSLayoutConstraint.activate([
                    formView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    formView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    formView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.tripleModule),
                    formView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metric.tripleModule),
                    formView.heightAnchor.constraint(equalToConstant: 100.0)
                ])
            }
            
            private func setupLoginButton() {
                view.addSubview(loginButton)
                
                NSLayoutConstraint.activate([
                    loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.doubleModule),
                    loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metric.doubleModule),
                    loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Metric.tripleModule),
                    loginButton.heightAnchor.constraint(equalToConstant: Metric.buttonHeight)
                ])
            }
            
        }
    }
    
}



