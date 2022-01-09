

import UIKit

class FeedViewController: UIViewController {
    
    struct Post {
        var title:String
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        navigationController?.navigationBar.backgroundColor = .lightGray
        
        let stackView : UIStackView = {
        let stackView = UIStackView ()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.toAutoLayout()
        return stackView
        }()
        
        
        view.addSubview(stackView)
        
        let blueButton : UIButton = {
        let blueButton = UIButton()
        blueButton.backgroundColor = .blue
        blueButton.setTitle("Пост", for: .normal)
        blueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blueButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        blueButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return blueButton
        }()
        
        let greenButton : UIButton = {
        let greenButton = UIButton()
        greenButton.backgroundColor = .green
        greenButton.setTitle("Пост", for: .normal)
        greenButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        greenButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        greenButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return greenButton
        }()
        
        stackView.addArrangedSubviews(blueButton, greenButton)
        
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 240)
        ])
        
        view.backgroundColor = .systemGray5
    }
    @objc func buttonAction() {
        let postviewcontroller = PostViewController()
        let post: Post = Post(title: "Post")
        postviewcontroller.title = post.title
        navigationController?.pushViewController(postviewcontroller, animated: true)
        print(photosArray.count)
    
    }
}

