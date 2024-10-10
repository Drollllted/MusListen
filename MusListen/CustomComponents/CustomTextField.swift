//
//  CustomTextField.swift
//  MusListen
//
//  Created by Drolllted on 08.10.2024.
//

import UIKit

enum VeriablesForTextField: String {
    case email = "Your's email"
    case password = "Your's password"
    case nickName = "Your's nickname"
}

final class CustomTextField: UIView {
    
    func createTextField(isPassword: Bool) -> UIView {
        
        lazy var viewForTextField: UIView = {
            let view = UIView()
            view.backgroundColor = .backbutton
            
            view.layer.cornerRadius = 15
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.gray.cgColor
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            return view
        }()
        
        lazy var leftImage: UIImageView = {
            let image = UIImageView()
            image.image = isPassword ? .lock : .mail
            image.contentMode = .scaleAspectFill
            image.tintColor = .gray
            image.translatesAutoresizingMaskIntoConstraints = false
            image.heightAnchor.constraint(equalToConstant: 15).isActive = true
            image.widthAnchor.constraint(equalToConstant: 15).isActive = true
            return image
        }()
        
        lazy var textFieldForView: UITextField = {
            let textField = UITextField()
            textField.placeholder = isPassword ? "Your's Password" : "Your's Login"
            textField.textContentType = isPassword ? .password : .emailAddress
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            textField.textColor = .white
            
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        
        self.addSubview(viewForTextField)
        viewForTextField.addSubview(leftImage)
        viewForTextField.addSubview(textFieldForView)
        
        
        NSLayoutConstraint.activate([
            viewForTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30),
            viewForTextField.heightAnchor.constraint(equalToConstant: 60),
            
            leftImage.leadingAnchor.constraint(equalTo: viewForTextField.leadingAnchor, constant: 15),
            leftImage.centerYAnchor.constraint(equalTo: viewForTextField.centerYAnchor),
            
            textFieldForView.leadingAnchor.constraint(equalTo: leftImage.trailingAnchor, constant: 15),
            textFieldForView.topAnchor.constraint(equalTo: viewForTextField.topAnchor),
            textFieldForView.bottomAnchor.constraint(equalTo: viewForTextField.bottomAnchor),
            textFieldForView.trailingAnchor.constraint(equalTo: viewForTextField.trailingAnchor),
            
        ])
        
        return viewForTextField
            
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
