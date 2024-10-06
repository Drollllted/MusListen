//
//  TabBarControllerCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 05.10.2024.
//

import UIKit

class TabBarControllerCoordinator: BaseCoordinator{
    
    private var navigationController: UINavigationController
    let tabBarController = UITabBarController()
    
    private lazy var mainCoordinator = HomeViewControllerCoordinator(navigationController: navigationController)
    private lazy var detailCoordinator = DetailViewControllerCoordinator(navigationController: navigationController)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        
    }
    
    private func setupTabBar() {
        tabBarController.tabBar.tintColor = .black
        
        tabBarController.viewControllers = [
            
        ]
        
        
    }
    
}
