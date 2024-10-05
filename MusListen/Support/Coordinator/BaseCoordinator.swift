//
//  BaseCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 05.10.2024.
//

import UIKit

class BaseCoordinator: Coordinator {
    var childrenCoordinator: [Coordinator] = []
    
    func start() {
        fatalError("Child should implement func start")
    }
    
    
}
