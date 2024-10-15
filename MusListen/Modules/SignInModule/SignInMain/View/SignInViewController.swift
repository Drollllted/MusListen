//
//  SignInViewController.swift
//  MusListen
//
//  Created by Drolllted on 06.10.2024.
//

import UIKit

final class SignInViewController: UIViewController {
    
    weak var signInViewControllerCoordinator: SignInViewControllerCoordinator?
    private var signInView: SignInView!
    
    private let firebaseService = FirebaseService.shared
    
    override func loadView() {
        signInView = SignInView()
        view = signInView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Sign In"
        objcFunctionsForButton()
    }
    
    private func objcFunctionsForButton() {
        signInView.loginWithEmailButton.addTarget(self, action: #selector(goToSignInWithEmail), for: .touchUpInside)
        signInView.signUpButton.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        signInView.googleButton.addTarget(self, action: #selector(signInWithGoogle), for: .touchUpInside)
    }
    
    //MARK: - Segue
    
    @objc private func goToSignInWithEmail() {
        signInViewControllerCoordinator?.goToSignInWithEmail()
    }
    
    @objc private func goToSignUp() {
        signInViewControllerCoordinator?.goToSignUP()
    }
    
    @objc private func signInWithGoogle() async -> Bool {
        print("qwerty)")
        do{
            let result = try await firebaseService.authWithGoogle()
            return result
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
    
}
