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

protocol SignUpWithEmail: Any {
    func registerForEmail(authRegister: UserRegData, completion: @escaping (Result<Bool, ErrorEnum>) -> ())
    
}

final class FirebaseService {
    
    static let shared = FirebaseService()
    
    private init(){}
    
    //MARK: - Auth
    
    func authForEmail(auth: AuthRegData, completion: @escaping ((Result<Bool, ErrorEnum>) -> ())) {
        Auth.auth().signIn(withEmail: auth.email, password: auth.password) { [weak self] result, err in
           
        }
    }
    
    //MARK: - Register
    
    func registerForEmail(authRegister: UserRegData, completion: @escaping (Result<Bool, ErrorEnum>) -> ()) {
        Auth.auth().createUser(withEmail: authRegister.email, password: authRegister.password) { [weak self] result, err in
            guard let self = self else {return}
            guard err == nil else {
                print(err!)
                completion(.failure(.failUpdateEmailOrPassword))
                return
            }
            
            print("231")
            
            result?.user.sendEmailVerification()
            self.signOut()
            print("321")
            completion(.success(true))
        }
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

