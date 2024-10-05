//
//  ViewController.swift
//  MusListen
//
//  Created by Drolllted on 05.10.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var mainViewControllerCoordinator: MainViewControllerCoordinator?
    
    private lazy var buttonScene: UIButton = {
        let button = UIButton()
        button.setTitle("Next Screen", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "main"
        
        buttonScene.addTarget(self, action: #selector(goToDetailView), for: .touchUpInside)
        
        view.addSubview(buttonScene)
        NSLayoutConstraint.activate([
            buttonScene.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonScene.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc private func goToDetailView() {
        mainViewControllerCoordinator?.goToNextScreen()
    }


}

