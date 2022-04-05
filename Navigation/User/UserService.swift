//
//  UserService.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 05.04.2022.
//

import UIKit

protocol UserService {

    func getUser(userFullName: String) -> User?

}
