//
//  User.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 05.04.2022.
//

import UIKit

final class User {
    
    let userFullName: String?
    let userAvatar: UIImage?
    let userStatus: String?
    
    init(userFullName: String?, userAvatar: UIImage?, userStatus: String?) {
        
        self.userFullName = userFullName
        self.userAvatar = userAvatar
        self.userStatus = userStatus
    }
    
    
    
    
}
