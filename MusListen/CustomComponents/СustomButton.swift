//
//  customButton.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class CustomButton: UIView {
    
    func setupConnectWithButton(logo: String, name: String) -> UIButton {
        
        lazy var backButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .backbutton
            button.layer.cornerRadius = 15
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        lazy var stackForButton: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 15
            stack.alignment = .center
            
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(logoImage)
            stack.addArrangedSubview(connectWithLabel)
            
            return stack
        }()
        
        lazy var logoImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: logo)
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
            
            image.translatesAutoresizingMaskIntoConstraints = false
            
            return image
        }()
        
        lazy var connectWithLabel: UILabel = {
            let label = UILabel()
            label.text = "Conntect with \(name)"
            label.font = .customFont(named: .afacadFluxBold, size: 20)
            label.textColor = .white
            label.textAlignment = .center
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        backButton.addSubview(stackForButton)
        
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 60),
            backButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30),
            
            stackForButton.centerXAnchor.constraint(equalTo: backButton.centerXAnchor),
            stackForButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            logoImage.heightAnchor.constraint(equalToConstant: 30),
            logoImage.widthAnchor.constraint(equalToConstant: 30),
            logoImage.centerYAnchor.constraint(equalTo: stackForButton.centerYAnchor),
        ])
        
        return backButton
        
    }
    
    func loginButton(name: String) -> UIButton {
        
        lazy var logButton: UIButton = {
            let button = UIButton()
            button.setTitle(name, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = .customFont(named: .afacadFluxBold, size: 20)
            
            button.backgroundColor = .onBoardBack
            button.layer.cornerRadius = 30
            
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        self.addSubview(logButton)
        
        NSLayoutConstraint.activate([
            logButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            logButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            logButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        return logButton
        
    }
    
    func roundedButtonLogin(imageLogo: String) -> UIButton {
        
        lazy var roundedButton: UIButton = {
            let button = UIButton()
            button.tintColor = .backbutton
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 33
            
            return button
        }()
        
        lazy var imageView: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFill
            image.image = UIImage(named: imageLogo)
            
            image.translatesAutoresizingMaskIntoConstraints = false
            
            return image
        }()
        
        self.addSubview(roundedButton)
        roundedButton.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            roundedButton.heightAnchor.constraint(equalToConstant: 65),
            roundedButton.widthAnchor.constraint(equalToConstant: 65),
            
            imageView.centerXAnchor.constraint(equalTo: roundedButton.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: roundedButton.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: roundedButton.heightAnchor, multiplier: 0.5),
            imageView.widthAnchor.constraint(equalTo: roundedButton.widthAnchor, multiplier: 0.5)
        ])
        
        return roundedButton
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
