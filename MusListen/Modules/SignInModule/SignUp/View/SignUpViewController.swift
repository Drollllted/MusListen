//
//  SignUpViewController.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    weak var signUpCoordinator: SignUpCoordinator?
    private var signUpView: SignUpView!
    
    override func loadView() {
        signUpView = SignUpView()
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupNavBar()
        objcFunctions()
    }
    
    private func setupNavBar() {
        navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(pop))
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func objcFunctions() {
        signUpView.signUpButton.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
    }
    
    @objc private func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func goToSignIn() {
        signUpCoordinator?.goToSignIn()
    }
    
}
