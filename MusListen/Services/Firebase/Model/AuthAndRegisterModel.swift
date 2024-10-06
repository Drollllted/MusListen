//
//  AuthAndRegisterModel.swift
//  MusListen
//
//  Created by Drolllted on 06.10.2024.
//

import Foundation

struct Auth {
    let email: String
    let password: String
}

struct Register {
    let email: String
    let password: String
    let userName: String?
}
