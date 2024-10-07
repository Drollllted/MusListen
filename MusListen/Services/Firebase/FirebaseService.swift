//
//  FirebaseService.swift
//  MusListen
//
//  Created by Drolllted on 06.10.2024.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseAuth

final class FirebaseService {
    
    static let shared = FirebaseService()
    
    private init(){}
    
    //MARK: - Auth
    
    func authForEmail(auth: AuthRegData, completion: @escaping ((Result<Bool, ErrorEnum>) -> ())) {
        Auth.auth().signIn(withEmail: auth.email, password: auth.password) { [weak self] result, err in
            guard let self = self else {return}
        }
    }
    
    //MARK: - Register
    
    func registerForEmail(authRegister: UserRegData, completion: @escaping (Result<Bool, ErrorEnum>) -> ()) {
        Auth.auth().createUser(withEmail: authRegister.email, password: authRegister.password) {result, err in
            
        }
    }
    
}

