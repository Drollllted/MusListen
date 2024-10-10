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
        objcFunctions()
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(pop))
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func objcFunctions() {
        signInWithEmailView.signUpButton.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
    }
    
    @objc private func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func goToSignUp() {
        signInWithEmailCoordinator?.goToSignUp()
    }
    
    
}
