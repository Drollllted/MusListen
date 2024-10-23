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
    
    private let viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
        signUpView.signInButton.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
        signUpView.signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    }
    
    @objc private func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func goToSignIn() {
        signUpCoordinator?.goToSignIn()
    }
    
    @objc private func signUpAction() {
        print("231")
        guard let emailTF = signUpView.emailTextFieldTF.text,
              let passwordTF = signUpView.passwordTextFieldTF.text,
              let nickNameTF = signUpView.nickNameTF.text else {
            print("Error: Text fields are not CustomTextField instances")
            return
        }
        
        guard !emailTF.isEmpty, !passwordTF.isEmpty, !nickNameTF.isEmpty else {
            print("Error: TextFields is Empty")
            return
        }

        let newUser = UserRegData(email: emailTF, password: passwordTF, userName: nickNameTF)
        viewModel.createAccount(userReg: newUser) { result in
            switch result{
            case .success(_):
                print("Success")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
