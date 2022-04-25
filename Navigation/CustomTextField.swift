//
//  CustomTextField.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 25.04.2022.
//

import Foundation
import UIKit


final class CustomTextField: UITextField {

    private let changeText: () -> Void

    var passwordText: String = ""

    init(changeText: @escaping () -> Void) {
        self.changeText = changeText
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(inputText), for: .editingChanged)
        self.toAutoLayout()
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.placeholder = "Enter`Password"
        self.text = ""
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 9, height: self.frame.height))
        self.leftViewMode = .always
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 9, height: self.frame.height))
        self.rightViewMode = .always
    
    }

    required init?(coder: NSCoder) {
        nil
    }

    @objc
    private func inputText() {
        self.changeText()
        Model.shared.gettingPassword = self.text ?? ""
    }
}
