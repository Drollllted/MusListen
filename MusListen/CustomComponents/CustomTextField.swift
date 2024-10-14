//
//  CustomTextField.swift
//  MusListen
//
//  Created by Drolllted on 08.10.2024.
//

import UIKit

enum VariablesForTextField: String {
    case email
    case password
    case nickName
    
    var placeholder: String {
        switch self {
        case .email: return "Your's email"
        case .password: return "Your's Password"
        case .nickName: return "Your's nickname"
        }
    }
    
    var contentType: UITextContentType {
        switch self {
        case .email: return .emailAddress
        case .password: return .newPassword
        default: return .name
        }
    }
    
    var image: UIImage? {
        switch self {
        case .email: return UIImage(systemName: "envelope.fill")
        case .password: return UIImage(systemName: "lock.fill")
        case .nickName: return UIImage(systemName: "person.fill")
        }
    }
}

final class CustomTextField: UITextField {
    
    private let textField: UITextField
    
    init(type: VariablesForTextField) {
        textField = UITextField()
        super.init(frame: .zero)
        
        setupView(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(type: VariablesForTextField) {
        backgroundColor = .backbutton
        
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        
        translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = type.placeholder
        textField.textContentType = type.contentType
        textField.attributedPlaceholder = NSAttributedString(string: type.placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textField.textColor = .white
        
        if type == .password {
            textField.isSecureTextEntry = true
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
        }
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let leftImage = UIImageView(image: type.image)
        leftImage.contentMode = .scaleAspectFill
        leftImage.tintColor = .gray
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textField)
        textField.addSubview(leftImage)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30),
            heightAnchor.constraint(equalToConstant: 60),
            
            leftImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            leftImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftImage.heightAnchor.constraint(equalToConstant: 15),
            leftImage.widthAnchor.constraint(equalToConstant: 15),
            
            textField.leadingAnchor.constraint(equalTo: leftImage.trailingAnchor, constant: 15),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
