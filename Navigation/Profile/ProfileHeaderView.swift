//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Тимур Турлыкин on 06.12.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    let hipsterCatLabel = UILabel()
    let statusLabel = UILabel()
    let statusButton = UIButton()
    let avatarImageView = UIImageView()
    let statusTextField = UITextField()
    let avatar = UIImage(named: "cat")
    var statusText : String = ""
   
    
    func addSubview() {
        addSubview(hipsterCatLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(avatarImageView)
        addSubview(statusTextField)
    }
    
    
    override init(frame: CGRect){
        super.init (frame: frame)
        
        hipsterCatLabel.font =
            UIFont.systemFont(
            ofSize: 18,
            weight: .bold)
        hipsterCatLabel.text = "Hipster Cat"
        hipsterCatLabel.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImageView.image = avatar
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        statusLabel.font =
            UIFont.systemFont(
            ofSize: 14,
            weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = "Waiting for something.."
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        statusButton.layer.cornerRadius = 4
        statusButton.backgroundColor = .blue
        statusButton.setTitle("Show Status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(
            self, action: #selector(buttonAction),
            for: .touchUpInside)
        statusButton.addTarget(
            self, action: #selector(statusChange),
            for: .editingChanged)
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        
        statusTextField.font =
            UIFont.systemFont(
            ofSize: 15,
            weight: .regular)
        statusTextField.placeholder = "Listening to music"
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 9, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
                                           
        
        addSubview()
    
    
    }
    
   
    
    required init(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    
    @objc func buttonAction() {
           print(statusLabel.text ?? "Status button pressed")
           statusLabel.text = statusTextField.text
       }
       
       @objc func statusChange(_ textField: UITextField){
           statusLabel.text = statusText
       }

    
   
    
    
}
