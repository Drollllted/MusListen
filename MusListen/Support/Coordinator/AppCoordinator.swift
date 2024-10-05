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
        
        return navCon
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        let mainViewControllerCoordinator = MainViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: mainViewControllerCoordinator)
        mainViewControllerCoordinator.start()
    }
}
