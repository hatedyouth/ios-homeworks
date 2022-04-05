//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 05.04.2022.
//

import UIKit

final class CurrentUserService: UserService {

    let user = User(userFullName: "Timur Turlykin", userAvatar: UIImage(named: "cat"), userStatus: "MyFirstStatus")

    func getUser(userFullName: String) -> User? {

        if userFullName == user.userFullName {
            return user
        } else {
            return nil
        }
    }
}





