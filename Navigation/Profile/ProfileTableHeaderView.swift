import UIKit
import SnapKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    static let identifire = "ProfileTableHeaderView"
    var statusText : String = ""
    
    static var timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.text = "30"
        return timerLabel
    }()
    
    
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
            ProfileTableHeaderView.self, action: #selector(buttonAction),
            for: .touchUpInside)
        statusButton.addTarget(
            ProfileTableHeaderView.self, action: #selector(statusChange),
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
        contentView.addSubviews (hipsterCatLabel, statusLabel, statusButton,  statusTextField, animatedView, animatedButton, avatarImageView, animatedButton, ProfileTableHeaderView.timerLabel)
    }
    
    func setupConstraints() {
        
        ProfileTableHeaderView.timerLabel.snp.makeConstraints { constraint in
            constraint.top.equalTo(contentView.snp.top).offset(20)
            constraint.right.equalTo(contentView.snp.right).offset(-30)
        }
        
        
        avatarImageView.snp.makeConstraints { constraint in
            constraint.left.top.equalToSuperview().inset(16)
            constraint.width.height.equalTo(140)
            
        }
        
        hipsterCatLabel.snp.makeConstraints { constraint in
            constraint.left.equalTo(avatarImageView.snp.right).offset(40)
            constraint.top.equalToSuperview().inset(27)
        }
        
        statusButton.snp.makeConstraints { constraint in
            constraint.left.equalTo(self.snp.left).offset(16)
            constraint.right.equalTo(self.snp.right).offset(-16)
            constraint.top.equalTo(avatarImageView.snp.bottom).offset(40)
            constraint.height.equalTo(50)
        }
        
        statusLabel.snp.makeConstraints { constraint in
            constraint.left.equalTo(avatarImageView.snp.right).offset(40)
            constraint.bottom.equalTo(statusButton.snp.top).offset(-64)
            constraint.height.equalTo(22)
        }
        
        statusTextField.snp.makeConstraints { constraint in
            constraint.left.equalTo(avatarImageView.snp.right).offset(40)
            constraint.bottom.equalTo(statusButton.snp.top).offset(-16)
            constraint.right.greaterThanOrEqualTo(contentView.snp.right).offset(-18)
            constraint.height.equalTo(40)
        }
        
        animatedButton.snp.makeConstraints { constraint in
            constraint.top.equalTo(contentView.snp.top).offset(16)
            constraint.right.equalTo(contentView.snp.right).offset(-16)
            constraint.width.height.equalTo(20)
            
        }
        
        
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


