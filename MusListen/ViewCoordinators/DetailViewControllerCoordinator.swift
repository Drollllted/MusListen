//
//  DetailViewControllerCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 05.10.2024.
//

import UIKit

class DetailViewControllerCoordinator: BaseCoordinator{
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let detailViewController = DetailViewController()
        detailViewController.detailViewControllerCoordinator = self
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
}
