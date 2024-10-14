//
//  SignUpCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignUpCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    private var signUpViewModel: SignUpViewModel
    
    init(navigationController: UINavigationController, viewModel: SignUpViewModel) {
        self.navigationController = navigationController
        self.signUpViewModel = viewModel
    }
    
    override func start() {
        let signUpViewController = SignUpViewController(viewModel: signUpViewModel)
        signUpViewController.signUpCoordinator = self
        self.navigationController.pushViewController(signUpViewController, animated: true)
    }
    
    func goToSignIn() {
        let signInViewControllerCoordinator = SignInViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: signInViewControllerCoordinator)
        signInViewControllerCoordinator.start()
    }
    
}
