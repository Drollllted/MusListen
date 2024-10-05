//
//  MainViewControllerCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 05.10.2024.
//

import UIKit

class MainViewControllerCoordinator: BaseCoordinator{
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let mainViewController = MainViewController()
        mainViewController.mainViewControllerCoordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func goToNextScreen() {
        let detailViewController = DetailViewController()
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
}
