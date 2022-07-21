import UIKit

class InfoViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.toAutoLayout()
        titleLabel.backgroundColor = .blue
        return titleLabel
    }()
    
    var orbitalPeriodLabel: UILabel = {
        let orbitalPeriodLabel = UILabel()
        orbitalPeriodLabel.toAutoLayout()
        return orbitalPeriodLabel
    }()
    
    var personNameTable: UITableView = {
        let personNameTable = UITableView()
        personNameTable.toAutoLayout()
        personNameTable.backgroundColor = .lightGray
        return personNameTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        
        //        let button : UIButton = {
        //            let button = UIButton()
        //            button.frame = CGRect(x: self.view.frame.size.width - 230, y: 400, width: 50, height: 50)
        //            button.backgroundColor = UIColor.systemPink
        //            button.setTitle("Alert", for: .normal)
        //            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        //            return button
        //        }()
        self.view.addSubviews (titleLabel, orbitalPeriodLabel, personNameTable)
        setupConstraints()
        titleLabel.text = NetworkManager.title
        orbitalPeriodLabel.text = "Орбитальный период = \(NetworkManager.orbitalPeriod)"
        self.personNameTable.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.personNameTable.dataSource = self
        
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
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            orbitalPeriodLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            orbitalPeriodLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            personNameTable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            personNameTable.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            personNameTable.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            personNameTable.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManager.namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.personNameTable.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.backgroundColor = .lightGray
        cell.textLabel?.text = NetworkManager.namesArray[indexPath.row]
           return cell
    }
}
class TableViewCell: UITableViewCell {}
