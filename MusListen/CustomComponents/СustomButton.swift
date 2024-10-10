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
        
        self.addSubview(backButton)
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
        
        lazy var buttonUI: UIButton = {
            let button = UIButton()
            button.backgroundColor = .clear
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
