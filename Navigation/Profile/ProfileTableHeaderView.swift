import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    static let identifire = "ProfileTableHeaderView"
    var statusText : String = ""
    
    let hipsterCatLabel : UILabel = {
        let hipsterCatLabel = UILabel()
        hipsterCatLabel.font =
        UIFont.systemFont(
            ofSize: 18,
            weight: .bold)
        hipsterCatLabel.text = "Hipster Cat"
        hipsterCatLabel.toAutoLayout()
        return hipsterCatLabel
    }()
    
    let statusLabel : UILabel = {
        let statusLabel = UILabel()
        statusLabel.font =
        UIFont.systemFont(
            ofSize: 14,
            weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = "Waiting for something.."
        statusLabel.toAutoLayout()
        return statusLabel
    }()
    
    let statusButton : UIButton = {
        let statusButton = UIButton()
        statusButton.layer.cornerRadius = 4
        statusButton.backgroundColor = .blue
        statusButton.setTitle("Show Status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shouldRasterize = true
        statusButton.layer.rasterizationScale = UIScreen.main.scale
        statusButton.addTarget(
            self, action: #selector(buttonAction),
            for: .touchUpInside)
        statusButton.addTarget(
            self, action: #selector(statusChange),
            for: .editingChanged)
        statusButton.toAutoLayout()
        return statusButton
    }()
    
    private(set) lazy var avatarImageView : UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image =  UIImage(named: "cat")
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.toAutoLayout()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAvatar))
        avatarImageView.addGestureRecognizer(gesture)
        avatarImageView.isUserInteractionEnabled = true
        
        return avatarImageView
    }()
    
    let statusTextField : UITextField = {
        let statusTextField = UITextField()
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
        statusTextField.toAutoLayout()
        return statusTextField
    }()
    
    func addSubviews() {
        contentView.addSubviews (hipsterCatLabel, statusLabel, statusButton,  statusTextField, animatedView, animatedButton, avatarImageView, animatedButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 140),
            avatarImageView.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 166),
            
            hipsterCatLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            hipsterCatLabel.heightAnchor.constraint(equalToConstant: 25),
            hipsterCatLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 40),
            
            
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            statusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 40),
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 40),
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -64),
            statusLabel.heightAnchor.constraint(equalToConstant: 22),
            
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            
            animatedButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            animatedButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            animatedButton.heightAnchor.constraint(equalToConstant: 20),
            animatedButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    override init(reuseIdentifier: String?){
        super.init (reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        contentView.backgroundColor = .systemGray6
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
    // animation settings
    
    
    var defaultAvatarCenter: CGPoint = CGPoint(x: 0, y: 0)
    
    private lazy var animatedView: UIView = {
        let animatedView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        animatedView.toAutoLayout()
        animatedView.backgroundColor = .gray
        animatedView.alpha = 0
        return animatedView
    }()
    
    private lazy var animatedButton: UIButton = {
        let animatedButton = UIButton()
        animatedButton.toAutoLayout()
        animatedButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        animatedButton.imageView?.contentMode = .scaleAspectFit
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapButton))
        animatedButton.addGestureRecognizer(gesture)
        animatedButton.isUserInteractionEnabled = true
        animatedButton.alpha = 0
        return animatedButton
    }()
    
    @objc func tapAvatar() {
        UIImageView.animate(withDuration: 0.5,
                            animations: {
            self.defaultAvatarCenter = self.avatarImageView.center
            self.avatarImageView.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            self.avatarImageView.transform = CGAffineTransform(scaleX: self.contentView.frame.width / self.avatarImageView.frame.width, y: self.contentView.frame.width / self.avatarImageView.frame.width)
            self.avatarImageView.layer.cornerRadius = 0
            self.animatedView.alpha = 0.7
            ProfileViewController.tableView.isScrollEnabled = false
            ProfileViewController.tableView.cellForRow(at: IndexPath(item: 0, section: 0))?.isUserInteractionEnabled = false
            self.avatarImageView.isUserInteractionEnabled = false
        },
                            completion: { _ in
            UIImageView.animate(withDuration: 0.3) {
                self.animatedButton.alpha = 1
            }
        })
    }
    
    @objc func tapButton() {
        UIImageView.animate(withDuration: 0.3,
                            animations: {
            self.animatedButton.alpha = 0
        },
                            completion: { _ in
            UIImageView.animate(withDuration: 0.5) {
                self.avatarImageView.center = self.defaultAvatarCenter
                self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width / 2
                self.animatedView.alpha = 0
                ProfileViewController.tableView.isScrollEnabled = true
                ProfileViewController.tableView.cellForRow(at: IndexPath(item: 0, section: 0))?.isUserInteractionEnabled = true
                self.avatarImageView.isUserInteractionEnabled = true
            }
        })
    }
}


