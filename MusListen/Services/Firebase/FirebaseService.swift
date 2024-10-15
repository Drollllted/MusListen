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
import GoogleSignIn
import FirebaseFirestore

final class FirebaseService {
    
    static let shared = FirebaseService()
    
    init(){}
    
    //MARK: - Auth
    
    func authForEmail(auth: AuthRegData, completion: @escaping ((Result<Bool, ErrorEnum>) -> ())) {
        Auth.auth().signIn(withEmail: auth.email, password: auth.password) { result, err in
            guard err == nil else {
                print(err!.localizedDescription)
                completion(.failure(.failUpdateEmailOrPassword))
                return
            }
            
            guard let user = result?.user else {
                completion(.failure(.emailExist))
                return
            }
            
            if !user.isEmailVerified {
                completion(.failure(.failUpdateEmailOrPassword))
            }
            
            completion(.success(true))
            
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
    
    //MARK: - Facebook
    
    func authWithFacebook() {
        
    }
    
    //MARK: - Google
    
    func authWithGoogle() async throws -> Bool {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No ClientID Found in Firebase")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = await windowScene.windows.first,
              let rootViewController = await window.rootViewController else {
            fatalError("There is not root view controller")
        }
        
        do {
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuthentication.user
            guard let idToken = user.idToken else {
                fatalError("ha-ha")
            }
            let accessToken = user.accessToken
            let credentical = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            let result = try await Auth.auth().signIn(with: credentical)
            let firebaseUser = result.user
            print("User: \(firebaseUser.uid) signed in with email \(firebaseUser.email ?? "unknow")")
            return true
        }
        catch{
            print(error.localizedDescription)
            return false
        }
    }
    
    //MARK: - Apple
    
    func authWithApple() {
        
    }
    
}

