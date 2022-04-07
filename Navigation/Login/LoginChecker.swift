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
    
    func check(login: Int, password: Int) -> (login: Int, password: Int) {
        if login == self.login.hash && password == self.password.hash {
            print("Данные верны.")
            return (self.login.hash, self.password.hash)
        }
        else {
            return (0, 0)
        }
    }
}
