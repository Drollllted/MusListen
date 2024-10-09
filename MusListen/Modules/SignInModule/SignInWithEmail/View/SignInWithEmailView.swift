//
//  SignInWithEmailView.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignInWithEmailView: UIView {
    
    private let emailTF = CustomTextField().createTextField(isPassword: false)
    private let passwordTF = CustomTextField().createTextField(isPassword: true)
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        constraintsUI()
        
        textFieldStack.addArrangedSubview(emailTF)
        textFieldStack.addArrangedSubview(passwordTF)
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
        ])
    }
}
