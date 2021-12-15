

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationController?.navigationBar.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.backgroundColor = .systemGray5
        
//        NSLayoutConstraint.activate([
//            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
//        ])
    
    }
    
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
        
    }
}
