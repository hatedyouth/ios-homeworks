//
//  LoginChecker.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 07.04.2022.
//

import UIKit

class LoginChecker {
    
    private let login = "timur"
    private let password = "timur"
    static let shared = LoginChecker()
    
    func check(login: String, password: String) -> Bool {
        if login.hash == self.login.hash && password.hash == self.password.hash {
            return true
        }
        else {
            return false
        }
    }
}