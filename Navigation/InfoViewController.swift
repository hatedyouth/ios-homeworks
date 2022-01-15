import UIKit

class InfoViewController: UIViewController {
    
    
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
        super.viewDidLoad()
let button : UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: self.view.frame.size.width - 230, y: 400, width: 50, height: 50)
            button.backgroundColor = UIColor.systemPink
            button.setTitle("Alert", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            return button
        }()
        self.view.addSubview(button)
    }
    @objc func buttonAction(sender: UIButton!) {
        let alertcontroller = UIAlertController(title: "Alert", message: "Alert", preferredStyle: .alert )
        let action1 = UIAlertAction(title: "Ok", style: .default) { (action) in
            print("Message")
        }
        let action2 = UIAlertAction(title: "Cancel", style: .default) { (action) in
            print("Message")
        }
        alertcontroller.addAction(action1)
        alertcontroller.addAction(action2)
        self.present(alertcontroller, animated: true, completion: nil)
    }
}
