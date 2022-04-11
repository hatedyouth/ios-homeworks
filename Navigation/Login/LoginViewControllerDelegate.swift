//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 07.04.2022.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    
    func check(login: String, password: String) -> Bool
    
}
