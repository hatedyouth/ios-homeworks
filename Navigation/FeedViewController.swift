

import UIKit

class FeedViewController: UIViewController {
    
    struct Post {
        var title:String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.size.width - 230, y: 400, width: 50, height: 50)
        button.backgroundColor = UIColor.brown
        button.setTitle("Пост", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    @objc func buttonAction() {
        let postviewcontroller = PostViewController()
        let post: Post = Post(title: "Post")
        postviewcontroller.title = post.title
        navigationController?.pushViewController(postviewcontroller, animated: true)
    }
}
