//
//  LoginFactory.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 07.04.2022.
//

import Foundation
import UIKit

protocol LoginFactory {
    func createLoginInspector() -> LoginInspector
}
