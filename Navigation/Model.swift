//
//  Model.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 25.04.2022.
//

import Foundation
import UIKit

class Model {

    static let shared = Model()

    let password: String = "t"
    var gettingPassword: String = ""

    init() {}

    func check() {
        if gettingPassword == password {
            let nc = NotificationCenter.default
            nc.post(name: Notification.Name("passwordIsRight"), object: nil)
        } else {
            let nc = NotificationCenter.default
            nc.post(name: Notification.Name("passwordIsNotRight"), object: nil)
        }
    }
}
