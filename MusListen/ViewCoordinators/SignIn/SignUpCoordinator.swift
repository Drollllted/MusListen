//
//  SignUpCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignUpCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let signUpViewController = SignUpViewController()
        signUpViewController.signUpCoordinator = self
        self.navigationController.pushViewController(signUpViewController, animated: true)
    }
    
}
