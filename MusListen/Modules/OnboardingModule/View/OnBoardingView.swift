//
//  OnBoardingView.swift
//  MusListen
//
//  Created by Drolllted on 06.10.2024.
//

import UIKit

final class OnBoardingView: UIView {
    
    lazy var womanBackgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = .womanBackground
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: - BackView
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 54
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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

extension OnBoardingView {
    func setupUI(){
        addSubview(womanBackgroundImage)
        addSubview(backView)
    }
    
    func constraintsUI(){
        NSLayoutConstraint.activate([
            womanBackgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            womanBackgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            womanBackgroundImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            womanBackgroundImage.heightAnchor.constraint(equalToConstant: 410),
            
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backView.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 130),
        ])
    }
}
