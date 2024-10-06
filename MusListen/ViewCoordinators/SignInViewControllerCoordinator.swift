//
//  SignInViewControllerCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 06.10.2024.
//

import UIKit

final class SignInViewControllerCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let signInViewController = SignInViewController()
        signInViewController.signInViewControllerCoordinator = self
        signInViewController.navigationItem.hidesBackButton = true
        self.navigationController.pushViewController(signInViewController, animated: true)
    }
    
}
