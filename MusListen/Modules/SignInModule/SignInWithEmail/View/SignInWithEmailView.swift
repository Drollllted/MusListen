//
//  SignInWithEmailView.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignInWithEmailView: UIView {
    
    lazy var email = UITextField()
    lazy var password = UITextField()
    
    private lazy var imageLogo: UIImageView = {
        let image = UIImageView()
        image.image = .logo
        image.contentMode = .scaleAspectFill
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var signInWithEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "Login to your account"
        label.font = .customFont(named: .afacadFluxExtraBold, size: 40)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - email and password tf
    
    func createTextFields(of type: VariablesForTextField, textField: UITextField) -> UIView {
        
        lazy var backView: UIView = {
            let view = UIView()
            view.backgroundColor = .backbutton
            
            view.layer.cornerRadius = 15
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.gray.cgColor
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            return view
        }()
        
        lazy var leftIcon: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFill
            image.image = type.image
            image.translatesAutoresizingMaskIntoConstraints = false
            image.tintColor = .gray
            
            return image
        }()
        
        textField.placeholder = type.placeholder
        textField.textContentType = type.contentType
        textField.attributedPlaceholder = NSAttributedString(string: type.placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textField.textColor = .white
        
        if type == .password {
            textField.isSecureTextEntry = true
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
        }else if type == .email && type == .nickName {
            textField.isSecureTextEntry = false
        }
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backView)
        backView.addSubview(leftIcon)
        backView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            backView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30),
            backView.heightAnchor.constraint(equalToConstant: 60),
            
            leftIcon.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            leftIcon.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            leftIcon.heightAnchor.constraint(equalToConstant: 15),
            leftIcon.widthAnchor.constraint(equalToConstant: 15),
            
            textField.leadingAnchor.constraint(equalTo: leftIcon.trailingAnchor, constant: 15),
            textField.topAnchor.constraint(equalTo: backView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            textField.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
        ])
        
        return backView
        
    }
    
    private lazy var textFieldStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    //MARK: - Login button
    
    lazy var loginButton = CustomButton().loginButton(name: "Sign In")
    
    //MARK: - Login with Apple etc. and Or
    
    private lazy var orConnectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Or Connection With:"
        label.font = .customFont(named: .afacadFluxBold, size: 20)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var connectWithStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 30
        stack.alignment = .center
        stack.distribution = .equalSpacing
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    func roundedButtonLogin(imageLogo: String) -> UIButton {
        
        lazy var buttonUI: UIButton = {
            let button = UIButton()
            button.backgroundColor = .clear
            button.translatesAutoresizingMaskIntoConstraints = false
            button.isUserInteractionEnabled = true
            
            return button
        }()
        
        lazy var roundedButton: UIButton = {
            let button = UIButton()
            button.layer.cornerRadius = 33
            button.setImage(UIImage(named: imageLogo), for: .normal)
            button.tintColor = .backbutton
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        lazy var roundedView: UIView = {
            let view = UIView()
            view.backgroundColor = .backbutton
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true
            view.layer.cornerRadius = 33
            
            return view
        }()
        
        lazy var logoImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: imageLogo)
            image.contentMode = .scaleAspectFill
            
            image.translatesAutoresizingMaskIntoConstraints = false
            
            return image
        }()
        self.addSubview(buttonUI)
        buttonUI.addSubview(roundedView)
        roundedView.addSubview(logoImage)
        
        NSLayoutConstraint.activate([
            buttonUI.heightAnchor.constraint(equalToConstant: 65),
            buttonUI.widthAnchor.constraint(equalToConstant: 65),
            
            roundedView.heightAnchor.constraint(equalToConstant: 60),
            roundedView.widthAnchor.constraint(equalToConstant: 60),
            
            logoImage.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 30),
            logoImage.widthAnchor.constraint(equalToConstant: 30),
        ])
        
        return buttonUI
        
    }
    
    lazy var googleButton: UIButton = CustomButton().roundedButtonLogin(imageLogo: "logoGoogle")
    lazy var facebookButton: UIButton = CustomButton().roundedButtonLogin(imageLogo: "logoFacebook")
    lazy var appleButton: UIButton = CustomButton().roundedButtonLogin(imageLogo: "logoApple")
    
    //MARK: Sign UP Stack
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Don’t have an account?"
        label.textColor = .white
        label.font = .customFont(named: .afacadFluxSemiBold, size: 18)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.onBoardBack, for: .normal)
        button.titleLabel?.font = .customFont(named: .afacadFluxSemiBold, size: 18)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var signUpStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(signUpLabel)
        stack.addArrangedSubview(signUpButton)
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        constraintsUI()
        
        let emailTF = createTextFields(of: .email, textField: email)
        let passwordTF = createTextFields(of: .password, textField: password)
        
        textFieldStack.addArrangedSubview(emailTF)
        textFieldStack.addArrangedSubview(passwordTF)
        
        connectWithStack.addArrangedSubview(googleButton)
        connectWithStack.addArrangedSubview(facebookButton)
        connectWithStack.addArrangedSubview(appleButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension SignInWithEmailView {
    func setupUI() {
        addSubview(imageLogo)
        addSubview(signInWithEmailLabel)
        addSubview(textFieldStack)
        addSubview(loginButton)
        addSubview(orConnectionLabel)
        addSubview(connectWithStack)
        addSubview(signUpStack)
    }
    
    func constraintsUI() {
        NSLayoutConstraint.activate([
            imageLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            imageLogo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            imageLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageLogo.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 2) - 190),
            
            signInWithEmailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signInWithEmailLabel.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 10),
            
            textFieldStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textFieldStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textFieldStack.topAnchor.constraint(equalTo: signInWithEmailLabel.bottomAnchor, constant: 15),
            
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            loginButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 20),
            
            orConnectionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            orConnectionLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            
            connectWithStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            connectWithStack.topAnchor.constraint(equalTo: orConnectionLabel.bottomAnchor, constant: 20),
            
            signUpStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signUpLabel.topAnchor.constraint(equalTo: connectWithStack.bottomAnchor, constant: 5),
        ])
    }
}
