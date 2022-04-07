//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 07.04.2022.
//

import UIKit

protocol LoginViewControllerDelegate{
    
    func check(login: Int, password: Int) -> Bool
    
}
