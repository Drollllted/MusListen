//
//  SignInWithEmailCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignInWithEmailCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let firebase = FirebaseService.shared
        let viewModel = SignInWithEmailViewModel(firebaseService: firebase)
        let signInWithEmailViewController = SignInWithEmailViewController(viewModel: viewModel)
        signInWithEmailViewController.signInWithEmailCoordinator = self
        navigationController.pushViewController(signInWithEmailViewController, animated: true)
    }
    
    func goToSignUp() {
        let signUpViewControllerCoordinator = SignUpCoordinator(navigationController: navigationController)
        add(coordinator: signUpViewControllerCoordinator)
        signUpViewControllerCoordinator.start()
    }
    
}
