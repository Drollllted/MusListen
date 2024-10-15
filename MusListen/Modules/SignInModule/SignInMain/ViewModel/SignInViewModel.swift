//
//  SignInViewModel.swift
//  MusListen
//
//  Created by Drolllted on 07.10.2024.
//

import UIKit

final class SignInViewModel {
    
    private let firebaseServise: FirebaseService
    
    init(firebaseServise: FirebaseService) {
        self.firebaseServise = firebaseServise
    }
    
    func signWithGoogle() async throws {
        do {
            let result = try await firebaseServise.authWithGoogle()
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
