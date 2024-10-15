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
    
    private let viewModel: SignInWithEmailViewModel
    
    init(viewModel: SignInWithEmailViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        signInWithEmailView.loginButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        signInWithEmailView.googleButton.addTarget(self, action: #selector(signWithGoogle), for: .touchUpInside)
        signInWithEmailView.facebookButton.addTarget(self, action: #selector(signWithFacebook), for: .touchUpInside)
        signInWithEmailView.appleButton.addTarget(self, action: #selector(signWithApple), for: .touchUpInside)
    }
    
    @objc private func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func goToSignUp() {
        signInWithEmailCoordinator?.goToSignUp()
    }
    
    @objc private func signInAction() {
        guard let email = signInWithEmailView.email.text,
              let password = signInWithEmailView.password.text else {
            print("error with TextFields")
            return
        }
        
        guard !email.isEmpty, !password.isEmpty else {
            print("email or password is Empty")
            return
        }
        
        let user = AuthRegData(email: email, password: password)
        viewModel.signInUser(for: user) { result in
            switch result {
            case .success(_):
                print("Success")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    @objc private func signWithGoogle() async {
        do {
            try await viewModel.signWithGoogle()
            print("Successfully signed in with Google")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc private func signWithFacebook() {
        print("Signing in with Facebook")
    }
    
    @objc private func signWithApple() {
        print("Signing in with Apple")
    }
}
