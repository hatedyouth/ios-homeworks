

import UIKit

class LogInViewController: UIViewController {
    
    fileprivate enum CellReuseIdentifiers: String {
        case loginpassword
    }
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    let vkLogo = UIImage(named: "vklogo")
    let bluePixel = UIImage(named: "blue_pixel")
    private lazy var vkImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = vkLogo
        
        return imageView
    }()
    
    private lazy var  loginButton : UIButton = {
        let uiButton = UIButton()
        uiButton.toAutoLayout()
        uiButton.clipsToBounds = true
        uiButton.layer.cornerRadius = 10
        uiButton.setTitle("Log In", for: .normal)
        uiButton.setTitleColor(.white, for: .normal)
        uiButton.setBackgroundImage(bluePixel, for: UIControl.State.normal )
        uiButton.addTarget(
            self, action: #selector(buttonAction),
            for: .touchUpInside)
        return uiButton
    }()
    
    private lazy var loginTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.toAutoLayout()
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 0.5
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        tableView.separatorInset = .zero
        tableView.register(TableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.loginpassword.rawValue)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vkImageView)
        contentView.addSubview(loginButton)
        contentView.addSubview(loginTableView)
        
        
        
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            vkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkImageView.heightAnchor.constraint(equalToConstant: 100),
            vkImageView.widthAnchor.constraint(equalToConstant: 100),
            
            vkImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            loginButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 456),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginTableView.topAnchor.constraint(equalTo: vkImageView.bottomAnchor, constant: 120),
            loginTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginTableView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    @objc func buttonAction() {
        let profileViewController = ProfileViewController()
        //present(profileViewController, animated: true, completion: nil)
        navigationController?.pushViewController(
            profileViewController,
            animated: true
        )    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}






extension LogInViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell(style: .default, reuseIdentifier: CellReuseIdentifiers.loginpassword.rawValue)
        if (indexPath.row == 0) {
            cell.loginTextField.placeholder = "Email or login";
        }
        else {
            cell.loginTextField.placeholder = "Password";
            cell.loginTextField.isSecureTextEntry = true
        }
        return cell
    }
}


