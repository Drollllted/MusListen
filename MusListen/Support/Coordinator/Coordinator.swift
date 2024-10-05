//
//  AppCoordinator.swift
//  MusListen
//
//  Created by Drolllted on 05.10.2024.
//

import UIKit

protocol Coordinator: AnyObject {
    var childrenCoordinator: [Coordinator] {get set}
    func start()
}

extension Coordinator {
    
    func add(coordinator: Coordinator) {
        childrenCoordinator.append(coordinator)
    }
    
    
    func remove(coordinator: Coordinator) {
        childrenCoordinator = childrenCoordinator.filter({ $0 !== coordinator})
    }
    
}
