//
//  SignInWithEmailViewModel.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignInWithEmailViewModel {
    
    private let firebaseService: FirebaseService
    
    init(firebaseService: FirebaseService) {
        self.firebaseService = firebaseService
    }
    
    func signInUser(for user: AuthRegData, completion: @escaping (Result <Bool, ErrorEnum>) -> ()) {
        firebaseService.authForEmail(auth: user, completion: completion)
    }
    
    func signWithGoogle() async throws {
        do {
            let result = try await firebaseService.authWithGoogle()
            if result {
                print("Successfully signed in with Google")
            } else {
                print("Failed to sign in with Google")
            }
        } catch {
            print("Error signing in with Google: \(error.localizedDescription)")
        }
    }
    
}
