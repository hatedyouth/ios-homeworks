//
//  NewCustomButton.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 25.04.2022.
//

import Foundation
import UIKit

final class NewCustomButton: UIButton {

    var buttonTap: () -> Void

    init(buttonTap: @escaping () -> Void) {
        self.buttonTap = buttonTap
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(tapForCheck), for: .touchUpInside)
        self.toAutoLayout()
        self.layer.cornerRadius = 16
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.setTitle(" Check Password ", for: .normal)
        self.setTitleColor(.black, for: .normal)
        
    }

    required init?(coder: NSCoder) {
        nil
    }

    @objc
    private func tapForCheck() {
        self.buttonTap()
        if Model.shared.gettingPassword != "" {
            Model.shared.check()
        }
    }
}
