//
//  LoginInspector.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 07.04.2022.
//
import Foundation
import UIKit
import FirebaseAuth

class LoginInspector: LoginViewControllerDelegate {
    func signIn(login: String, password: String) {
        
        Auth.auth().createUser(withEmail: login, password: password) { result, error in
            
            if let error = error {
                LoginViewController.signInError = error.localizedDescription
                NotificationCenter.default.post(name: Notification.Name("signInError"), object: nil)
            } else {
                NotificationCenter.default.post(name: Notification.Name("signInSuccess"), object: nil)
            }
        }
    }
    
    
    func logIn(login: String, password: String) {
        
        Auth.auth().signIn(withEmail: login, password: password) { authResult, error in
            
            if let error = error {
                LoginViewController.logInError = error.localizedDescription
                NotificationCenter.default.post(name: Notification.Name("logInError"), object: nil)
            } else {
                NotificationCenter.default.post(name: Notification.Name("logInSuccess"), object: nil)
            }
        }
    }


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
