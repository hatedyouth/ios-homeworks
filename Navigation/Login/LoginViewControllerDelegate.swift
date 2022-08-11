//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 07.04.2022.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    
    func signIn(login: String, password: String)
    func logIn(login: String, password: String)
    func check(login: String, password: String) -> Bool
    
}
