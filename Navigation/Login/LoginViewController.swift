
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var isLogin: Bool = false
    var delegate: LoginViewControllerDelegate?
    
    private lazy var brutPasswordButton: UIButton = {
        let brutPasswordButton = UIButton()
        brutPasswordButton.toAutoLayout()
        if let image = UIImage(named: "blue_pixel") {
            brutPasswordButton.setBackgroundImage(image.image(alpha: 1), for: .normal)
            brutPasswordButton.setBackgroundImage(image.image(alpha: 0.8), for: .selected)
            brutPasswordButton.setBackgroundImage(image.image(alpha: 0.8), for: .highlighted)
            brutPasswordButton.setBackgroundImage(image.image(alpha: 0.8), for: .disabled)
        }
        brutPasswordButton.setTitle("Подобрать пароль", for: .normal)
        brutPasswordButton.setTitleColor(.white, for: .normal)
        brutPasswordButton.addTarget(self, action: #selector(brutPasswordButtonPressed), for: .touchUpInside)
        brutPasswordButton.layer.cornerRadius = 10
        brutPasswordButton.clipsToBounds = true
        return brutPasswordButton
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.toAutoLayout()
        activityIndicator.style = UIActivityIndicatorView.Style.large
        return activityIndicator
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.toAutoLayout()
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.toAutoLayout()
        contentView.backgroundColor = .white
        return contentView
    }()
    private lazy var vkImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.toAutoLayout()
        imageView.clipsToBounds = true
        let vkLogo = UIImage(named: "vklogo")
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
        let bluePixel = UIImage(named: "blue_pixel")
        uiButton.setBackgroundImage(bluePixel, for: UIControl.State.normal )
        uiButton.addTarget(
            self, action: #selector(buttonAction),
            for: .touchUpInside)
        return uiButton
    }()
    
    private lazy var loginStackView: UIStackView = {
        let loginStackView = UIStackView()
        loginStackView.toAutoLayout()
        loginStackView.axis = .vertical
        loginStackView.layer.borderColor = UIColor.lightGray.cgColor
        loginStackView.layer.borderWidth = 0.5
        loginStackView.layer.cornerRadius = 10
        loginStackView.distribution = .fillProportionally
        loginStackView.backgroundColor = .systemGray6
        loginStackView.clipsToBounds = true
        return loginStackView
    }()
    lazy  var loginTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.toAutoLayout()
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.25
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 9, height: textField.frame.height))
        textField.placeholder = "Email or phone"
        textField.leftViewMode = .always
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        return textField
    }()
    
    lazy  var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.toAutoLayout()
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.25
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 9, height: textField.frame.height))
        textField.placeholder = "Password"
        textField.leftViewMode = .always
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(vkImageView, loginStackView, loginButton, brutPasswordButton, activityIndicator)
        loginStackView.addArrangedSubviews(loginTextField, passwordTextField)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            vkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkImageView.heightAnchor.constraint(equalToConstant: 100),
            vkImageView.widthAnchor.constraint(equalToConstant: 100),
            vkImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            loginButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 456),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginStackView.topAnchor.constraint(equalTo: vkImageView.bottomAnchor, constant: 120),
            loginStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginStackView.heightAnchor.constraint(equalToConstant: 100),
            
            brutPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            brutPasswordButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            brutPasswordButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            brutPasswordButton.heightAnchor.constraint(equalToConstant: 50),
            activityIndicator.centerXAnchor.constraint(equalTo: brutPasswordButton.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: brutPasswordButton.centerYAnchor),
            
        ])}
    
    
    @objc func buttonAction() {
        if let image = UIImage(named: "blue_pixel") {
            loginButton.setBackgroundImage(image.image(alpha: 0.8), for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                self.loginButton.setBackgroundImage(image.image(alpha: 1), for: .normal)
            }
        }
        guard loginTextField.text?.isEmpty == false else {
            let alertVC = UIAlertController(title: "Error", message: "Enter Login!", preferredStyle: .alert)
            let action = UIAlertAction(title: "ОК", style: .default, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
            return }
        
        guard passwordTextField.text?.isEmpty == false else {
            let alertVC = UIAlertController(title: "Error", message: "Enter Password!", preferredStyle: .alert)
            let action = UIAlertAction(title: "ОК", style: .default, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
            return }
        
        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let delegate = delegate else { return }
        let result = delegate.check(login: login, password: password)
        
        if result {
            isLogin = true
            print("переходим в Profile")
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)
        } else {
            isLogin = false
            let alertVC = UIAlertController(title: "Ошибка", message: "Такого пользователя не существует", preferredStyle: .alert)
            let action = UIAlertAction(title: "ОК", style: .default, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
        }
   }
    
    @objc private func brutPasswordButtonPressed() {
        
        let passwordLengh = 4
        
        // блокируем кнопку
        self.brutPasswordButton.isEnabled = false
        self.activityIndicator.startAnimating()
        
        DispatchQueue.global().async {
            
            // генерируем пароль
            GeneratePassword.shared.generatePass(count: passwordLengh)
            print(GeneratePassword.shared.generatedPassword)
            
            // брутфорс пароля
            let passwordsArray = Brutforce.shared.generate(length: passwordLengh)
            for password in passwordsArray {
                if password == GeneratePassword.shared.generatedPassword {
                    
                    DispatchQueue.main.async {
                        self.passwordTextField.text = password
                        self.passwordTextField.isSecureTextEntry = false
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                        self.brutPasswordButton.isEnabled = true
                    }
                    print("пароль найден - \(password)")
                    break
                }
            }
        }
    }
    
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

