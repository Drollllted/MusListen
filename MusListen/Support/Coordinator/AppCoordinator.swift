//
//  AppCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 05.10.2024.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    
    private var navigationController: UINavigationController = {
        let navCon = UINavigationController()
        navCon.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]
        return navCon
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        let onboardingViewControllerCoordinator = OnboardingViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: onboardingViewControllerCoordinator)
        onboardingViewControllerCoordinator.start()
    }
}
