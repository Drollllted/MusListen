//
//  ViewController.swift
//  MusListen
//
//  Created by Drolllted on 05.10.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    weak var mainViewControllerCoordinator: HomeViewControllerCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "main"
    }

}

