

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationController?.navigationBar.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.backgroundColor = .systemGray5
    }
    
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
        
    }
}
