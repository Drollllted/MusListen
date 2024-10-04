//
//  AppCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 05.10.2024.
//

import UIKit

protocol Coordinator: Any {
    var parentCoordinator: Coordinator? {get set}
    var children: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}


class AppCoordinator: Coordinator{
    var parentCoordinator: (any Coordinator)?
    var children: [any Coordinator] = []
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        
    }
    
    
}
