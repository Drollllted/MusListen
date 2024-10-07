//
//  ErrorEnum.swift
//  MusListen
//
//  Created by Drolllted on 06.10.2024.
//

import Foundation

enum ErrorEnum: String, Error {
    case enterEmail = "Enter the Email"
    case enterPassword = "Enter the Password"
    case incorrectEmail = "Check your Email. Write corrected"
    case incorrectPassword = "Check your Password. Write corrected"
    case incorrectEmailOrLogin = "Incorrect email and/or password"
    case nameExist = "Name already exist"
    case emailExist = "Email already exist"
    case failUpdateEmailOrPassword = "Failed to update your email and/or password.\nRe-authorise, then try again"
    case passwordNotConfirm = "Passwords do not match"
    
    static var isPressented = false
}

enum Verifivation {
    case verification, noVerification
}
