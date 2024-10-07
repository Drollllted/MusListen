//
//  SignInView.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignInView: UIView {
    
    //MARK: - Logo
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = .logo
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var hiLabel: UILabel = {
        let label = UILabel()
        label.text = "Let’s get you in"
        label.textColor = .white
        label.font = .customFont(named: .afacadFluxExtraBold, size: 44)
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
    }
    
    func constraintsUI() {
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImage.heightAnchor.constraint(equalToConstant: 250),
            
            hiLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            hiLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            hiLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10),
        ])
    }
}
