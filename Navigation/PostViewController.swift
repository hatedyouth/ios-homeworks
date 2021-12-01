

import UIKit

class PostViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .systemGray
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (barButtonSystemItem: .play, target: self, action: #selector(openinfo))
        
       
    
    }
    
    
   
    
    @objc func openinfo() {
        let infoview = InfoViewController()
        present(infoview, animated: true, completion: nil)
    }



   

}
