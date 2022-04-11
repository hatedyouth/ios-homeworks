//
//  LoginFactory.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 07.04.2022.
//

import Foundation
import UIKit

class MyLoginFactory: LoginFactory {
    func createLoginInspector() -> LoginInspector {
        let inspector = LoginInspector()
        return inspector
    }
}


