//
//  OnBoardingViewController.swift
//  MusListen
//
//  Created by Drolllted on 06.10.2024.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    weak var onBoardingViewControllerCoordinator: OnboardingViewControllerCoordinator?
    private var onBoardingView: OnBoardingView!
    
    override func loadView() {
        onBoardingView = OnBoardingView()
        view = onBoardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .onBoardBack
        onBoardingView.getStartedButton.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
    }
    
    @objc private func goToSignIn() {
        onBoardingViewControllerCoordinator?.goToSignInVC()
    }
    
}
