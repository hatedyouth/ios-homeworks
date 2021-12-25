//
//  Extensions.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 24.12.2021.
//

import Foundation
import UIKit

public extension UIView {

func toAutoLayout() {
    translatesAutoresizingMaskIntoConstraints = false
}

func addSubviews(_ subviews: UIView...) {
    subviews.forEach { addSubview($0) }
}
}
