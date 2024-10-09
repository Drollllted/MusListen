//
//  SignInView.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignInView: UIView {
    
    let googleButton = CustomButton().setupConnectWithButton(logo: "logoGoogle", name: "Google")
    let faceBookButton = CustomButton().setupConnectWithButton(logo: "logoFacebook", name: "Facebook")
    let appleButton = CustomButton().setupConnectWithButton(logo: "logoApple", name: "Apple")
    
    //MARK: - Logo
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = .logo
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var hiLabel: UILabel = {
        let label = UILabel()
        label.text = "Let’s get you in"
        label.textColor = .white
        label.font = .customFont(named: .afacadFluxExtraBold, size: 44)
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Register Buttons For Google, Apple, Facebook
    
   private lazy var stackButtonsRegister: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(googleButton)
        stack.addArrangedSubview(faceBookButton)
        stack.addArrangedSubview(appleButton)
        
        return stack
    }()
    
    //MARK: - Sign In with Email or Sign Up
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.textColor = .white
        label.font = .customFont(named: .afacadFluxBold, size: 20)
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var loginWithEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in with a password", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .customFont(named: .afacadFluxBold, size: 20)
        
        button.backgroundColor = .onBoardBack
        button.layer.cornerRadius = 30
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension SignInView {
    func setupUI() {
        addSubview(logoImage)
        addSubview(hiLabel)
        addSubview(stackButtonsRegister)
        addSubview(orLabel)
        addSubview(loginWithEmailButton)
        addSubview(signUpStack)
    }
    
    func constraintsUI() {
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImage.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 2) - 190 ),
            
            hiLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            hiLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            hiLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10),

            stackButtonsRegister.topAnchor.constraint(equalTo: hiLabel.bottomAnchor, constant: 15),
            stackButtonsRegister.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            stackButtonsRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            orLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            orLabel.topAnchor.constraint(equalTo: stackButtonsRegister.bottomAnchor, constant: 20),
            
            loginWithEmailButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            loginWithEmailButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            loginWithEmailButton.heightAnchor.constraint(equalToConstant: 60),
            loginWithEmailButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            
            signUpStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signUpLabel.topAnchor.constraint(equalTo: loginWithEmailButton.bottomAnchor, constant: 5),
        ])
    }
}
