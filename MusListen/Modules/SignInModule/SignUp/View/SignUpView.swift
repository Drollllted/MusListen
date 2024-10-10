//
//  SignUpView.swift
//  MusListen
//
//  Created by Drolllted on 10.10.2024.
//

import UIKit

final class SignUpView: UIView {
    
    private lazy var imageLogo: UIImageView = {
        let image = UIImageView()
        image.image = .logo
        image.contentMode = .scaleAspectFill
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var textForView: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = .white
        label.font = .customFont(named: .afacadFluxBold, size: 40)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - TextFields
    
    lazy var nickNameTextField = CustomTextField().createTextField(isPassword: false)
    lazy var emailTextField = CustomTextField().createTextField(isPassword: false)
    lazy var passwordTextField = CustomTextField().createTextField(isPassword: true)
    
    private lazy var stackTextFields: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    //MARK: - Sign Up Button
    
    lazy var signUpButton: UIButton = CustomButton().loginButton(name: "Sign Up For Listen")
    
    //MARK: - Label For Sign In
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = .white
        label.font = .customFont(named: .afacadFluxSemiBold, size: 18)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.onBoardBack, for: .normal)
        button.titleLabel?.font = .customFont(named: .afacadFluxSemiBold, size: 18)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var signInStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(signInLabel)
        stack.addArrangedSubview(signInButton)
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        constraintsUI()
        
        stackTextFields.addArrangedSubview(nickNameTextField)
        stackTextFields.addArrangedSubview(emailTextField)
        stackTextFields.addArrangedSubview(passwordTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension SignUpView {
    func setupUI() {
        addSubview(imageLogo)
        addSubview(textForView)
        addSubview(stackTextFields)
        addSubview(signUpButton)
        addSubview(signInStack)
    }
    
    func constraintsUI() {
        NSLayoutConstraint.activate([
            imageLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            imageLogo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            imageLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageLogo.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 2) - 190),
            
            textForView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textForView.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 10),
            
            stackTextFields.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            stackTextFields.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            stackTextFields.topAnchor.constraint(equalTo: textForView.bottomAnchor, constant: 10),
            
            signUpButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            signUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            signUpButton.topAnchor.constraint(equalTo: stackTextFields.bottomAnchor, constant: 20),
            
            signInStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signInStack.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 5),
        ])
    }
}
