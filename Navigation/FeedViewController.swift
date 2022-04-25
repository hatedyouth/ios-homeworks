

import UIKit

final class FeedViewController: UIViewController {
    
    var password: String = ""
    
    
    
    struct Post {
        var title:String
    }
    
    lazy private var  blueButton : CustomButton = {
        var blueButton = CustomButton(title: "Пост", titleColor: .black) {
            let postviewcontroller = PostViewController()
            let post: Post = Post(title: "Post")
            postviewcontroller.title = post.title
            self.navigationController?.pushViewController(postviewcontroller, animated: true)
        }
        blueButton.backgroundColor = .blue
        blueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blueButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return blueButton
    }()
    
    lazy private var  greenButton : CustomButton = {
        var greenButton = CustomButton(title: "Пост", titleColor: .black) {
            let postviewcontroller = PostViewController()
            let post: Post = Post(title: "Post")
            postviewcontroller.title = post.title
            self.navigationController?.pushViewController(postviewcontroller, animated: true)
        }
        greenButton.backgroundColor = .green
        greenButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        greenButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return greenButton
    }()
    
    var customTextfield: CustomTextField = {
        let customTextfield = CustomTextField {}
        return customTextfield
    }()
    
    lazy private var customButton: NewCustomButton = {
        var customButton = NewCustomButton {}
        return customButton
    }()
    
    lazy var colorLabel: UILabel = {
        let colorLabel = UILabel()
        colorLabel.isHidden = true
        colorLabel.backgroundColor = .white
        return colorLabel
    }()
    
    let stackView : UIStackView = {
        let stackView = UIStackView ()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        navigationController?.navigationBar.backgroundColor = .lightGray
        view.addSubview(stackView)
        stackView.addArrangedSubviews(blueButton,greenButton,customTextfield, customButton,colorLabel)
        stackView.distribution = .fillEqually
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(passwordIsRight), name: Notification.Name("passwordIsRight"), object: nil)
        nc.addObserver(self, selector: #selector(passwordIsNotRight), name: Notification.Name("passwordIsNotRight"), object: nil)

        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 240)
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
    
    @objc
        private func passwordIsRight() {
            colorLabel.text = "Yes"
            colorLabel.textColor = .green
            colorLabel.isHidden = false
        }

        @objc
        private func passwordIsNotRight() {
            colorLabel.text = "No"
            colorLabel.textColor = .red
            colorLabel.isHidden = false
        }
}

