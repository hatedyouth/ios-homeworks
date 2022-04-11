//
//  LoginInspector.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 07.04.2022.
//
import Foundation
import UIKit

class LoginInspector: LoginViewControllerDelegate {

    func check(login: String, password: String) -> Bool {
        let checkData = LoginChecker.shared.check(login: login, password: password)
        if checkData {
            print("Correct")
            return true
        } else {
            print("Uncorrect")
            return false
        }
    
    }
}
