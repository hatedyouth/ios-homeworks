

import UIKit

class TableViewCell: UITableViewCell, UITextFieldDelegate {
    
    lazy  var loginTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 9, height: textField.frame.height))
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(loginTextField)
        

        
        
        NSLayoutConstraint.activate([
            loginTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            loginTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
            loginTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
