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
        let firebase = FirebaseService.shared
        let viewModel = SignUpViewModel(firebaseService: firebase)
        let signUpViewController = SignUpViewController(viewModel: viewModel)
        signUpViewController.signUpCoordinator = self
        self.navigationController.pushViewController(signUpViewController, animated: true)
    }
    
    func goToSignIn() {
        let signInViewControllerCoordinator = SignInViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: signInViewControllerCoordinator)
        signInViewControllerCoordinator.start()
    }
    
}
