//
//  SignUpViewModel.swift
//  MusListen
//
//  Created by Drolllted on 14.10.2024.
//

import UIKit

final class SignUpViewModel {
    
    private let firebaseService: FirebaseService
    
    init(firebaseService: FirebaseService) {
        self.firebaseService = firebaseService
    }
    
    func createAccount(userReg: UserRegData, completion: @escaping (Result<Bool, ErrorEnum>) -> ()) {
        firebaseService.registerForEmail(authRegister: userReg, completion: completion)
    }
}
