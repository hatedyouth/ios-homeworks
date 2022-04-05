//
//  TestUserService.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 05.04.2022.
//

import UIKit

final class TestUserService: UserService {
    
    let user = User(userFullName: "test", userAvatar: UIImage(named: "testavatar"), userStatus: "test status")
    
    func getUser(userFullName: String) -> User? {
        
        if userFullName == user.userFullName {
            return user
        } else {
            return nil
        }
    }
    
}
