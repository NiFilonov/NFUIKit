import UIKit

extension NFViewController {
    
    public enum Templates {
        
        public static func loginViewController(with viewControllerStyle: NFViewControllerStyle,
                                     formStyle: NFFormStyle,
                                     buttonStyle: NFButtonStyle,
                                     mainTitleText: NSAttributedString,
                                     descriptionTitleText: NSAttributedString) -> NFLoginViewController {
            return NFLoginViewController(viewControllerStyle: viewControllerStyle,
                                         formStyle: formStyle,
                                         buttonStyle: buttonStyle,
                                         mainTitleText: mainTitleText,
                                         descriptionTitleText: descriptionTitleText)
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
            private var mainTitleText: NSAttributedString
            private var descriptionTitleText: NSAttributedString
            
            init(viewControllerStyle: NFViewControllerStyle,
                 formStyle: NFFormStyle,
                 buttonStyle: NFButtonStyle,
                 mainTitleText: NSAttributedString,
                 descriptionTitleText: NSAttributedString) {
                self.viewControllerStyle = viewControllerStyle
                self.formStyle = formStyle
                self.buttonStyle = buttonStyle
                self.mainTitleText = mainTitleText
                self.descriptionTitleText = descriptionTitleText
                
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
                    titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.doubleModule),
                    titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metric.doubleModule),
                    titleLabel.bottomAnchor.constraint(equalTo: formView.topAnchor, constant: -Metric.tripleModule)
                ])
            }
            
            private func setupFormView() {
                view.addSubview(formView)
                
                NSLayoutConstraint.activate([
                    formView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    formView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    formView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.doubleModule),
                    formView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metric.doubleModule),
                    formView.heightAnchor.constraint(equalToConstant: 200.0)
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



