//
//  OnboardingViewControllerCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 06.10.2024.
//

import UIKit

class OnboardingViewControllerCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let onboardingViewController = OnBoardingViewController()
        onboardingViewController.onBoardingViewControllerCoordinator = self
        self.navigationController.pushViewController(onboardingViewController, animated: true)
    }
    
    func goToSignInVC() {
        let signInViewControllerCoordinator = SignInViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: signInViewControllerCoordinator)
        signInViewControllerCoordinator.start()
    }
    
}
