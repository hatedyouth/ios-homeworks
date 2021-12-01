

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Посмотреть пост"
        view.backgroundColor = .systemGray
        let button = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(openinfo))
        navigationItem.backBarButtonItem = button
    
    
    }
    
    @objc func openinfo() {
        let infoview = InfoViewController()
        present(infoview, animated: true, completion: nil)
    }



   

}
