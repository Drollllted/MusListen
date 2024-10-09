//
//  SignInWithEmailViewController.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignInWithEmailViewController: UIViewController {
    
    weak var signInWithEmailCoordinator: SignInWithEmailCoordinator?
    private var signInWithEmailView: SignInWithEmailView!
    
    override func loadView() {
        signInWithEmailView = SignInWithEmailView()
        view = signInWithEmailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    
}
