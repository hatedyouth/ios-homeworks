

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView ()
    
    
    let customButton : UIButton = {
        let customButton = UIButton()
        customButton.backgroundColor = .purple
        customButton.toAutoLayout()
        customButton.setTitle("Custom Button", for: .normal)
        return customButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationController?.navigationBar.backgroundColor = .lightGray
        
        view.addSubviews(profileHeaderView,customButton)
        
        
        profileHeaderView.backgroundColor = .systemGray5
        profileHeaderView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            profileHeaderView.avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileHeaderView.avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileHeaderView.avatarImageView.heightAnchor.constraint(equalToConstant: 140),
            profileHeaderView.avatarImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 166),
            
            profileHeaderView.hipsterCatLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            profileHeaderView.hipsterCatLabel.heightAnchor.constraint(equalToConstant: 25),
            profileHeaderView.hipsterCatLabel.leadingAnchor.constraint(equalTo: profileHeaderView.avatarImageView.trailingAnchor, constant: 40),
            
            
            profileHeaderView.statusButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileHeaderView.statusButton.bottomAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: -4),
            profileHeaderView.statusButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            profileHeaderView.statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            profileHeaderView.statusLabel.leadingAnchor.constraint(equalTo: profileHeaderView.avatarImageView.trailingAnchor, constant: 40),
            profileHeaderView.statusLabel.bottomAnchor.constraint(equalTo: profileHeaderView.statusButton.topAnchor, constant: -64),
            profileHeaderView.statusLabel.heightAnchor.constraint(equalToConstant: 22),
            
            profileHeaderView.statusTextField.heightAnchor.constraint(equalToConstant: 40),
            profileHeaderView.statusTextField.bottomAnchor.constraint(equalTo: profileHeaderView.statusButton.topAnchor, constant: -16),
            profileHeaderView.statusTextField.leadingAnchor.constraint(equalTo: profileHeaderView.avatarImageView.trailingAnchor, constant: 40),
            profileHeaderView.statusTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            customButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            customButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            customButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            customButton.heightAnchor.constraint(equalToConstant: 35)
            
        ])
        
    }
    
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
        
    }
}
