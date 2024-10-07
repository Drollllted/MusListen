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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
