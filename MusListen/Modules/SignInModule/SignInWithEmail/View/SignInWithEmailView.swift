//
//  SignInWithEmailView.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignInWithEmailView: UIView {
    
    lazy var emailTF = CustomTextField().createTextField(isPassword: false)
    lazy var passwordTF = CustomTextField().createTextField(isPassword: true)
    
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
