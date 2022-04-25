//
//  File.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 22.04.2022.
//

import Foundation
import UIKit

final class CustomButton : UIButton {
    
    private var buttonAction: () -> Void
    
    
    init(title: String, titleColor: UIColor, buttonAction: @escaping () -> Void) {
        self.buttonAction = buttonAction
        super.init(frame: .zero)
        self.layer.cornerRadius = 22
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.toAutoLayout()
        
    }
    @objc private func buttonTapped() {
        self.buttonAction()
    }
    required init?(coder: NSCoder) {
        nil
    }
}
