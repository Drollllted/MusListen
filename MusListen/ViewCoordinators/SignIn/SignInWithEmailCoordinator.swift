//
//  SignInWithEmailCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignInWithEmailCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    private var viewModel: SignInWithEmailViewModel
    
    init(navigationController: UINavigationController, viewModel: SignInWithEmailViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    override func start() {
        let signInWithEmailViewController = SignInWithEmailViewController(viewModel: viewModel)
        signInWithEmailViewController.signInWithEmailCoordinator = self
        navigationController.pushViewController(signInWithEmailViewController, animated: true)
    }
    
    func goToSignUp() {
        let signUpViewControllerCoordinator = SignUpCoordinator(navigationController: navigationController,
                                                                viewModel: SignUpViewModel(firebaseService: FirebaseService()))
        add(coordinator: signUpViewControllerCoordinator)
        signUpViewControllerCoordinator.start()
    }
    
}
