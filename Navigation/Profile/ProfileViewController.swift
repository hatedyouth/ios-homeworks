

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    
    var login: String?
    
    static var  tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.toAutoLayout()
        tableView.separatorInset = .zero
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileTableHeaderView.identifire)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifire)
        return tableView
    }()
    
    
    private var timeInterval: TimeInterval = 30
    private var myTimer : Timer?
    
    private func timer() {
        var timerData = 30
        ProfileTableHeaderView.timerLabel.text = "\(timerData)"
        
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            timerData -= 1
            
            
            if self.timeInterval == 0 {
                self.timeInterval = 30
                ProfileTableHeaderView.timerLabel.text = "\(self.timeInterval)"
                self.updatePostArray()
            } else { ProfileTableHeaderView.timerLabel.text = "\(self.timeInterval)"}
        }
        RunLoop.current.add(timer, forMode: .common)
        RunLoop.current.run()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(ProfileViewController.tableView)
        ProfileViewController.tableView.dataSource = self
        ProfileViewController.tableView.delegate = self
        setupConstraints()
        ProfileViewController.tableView.refreshControl = UIRefreshControl()
        ProfileViewController.tableView.refreshControl?.addTarget(self, action: #selector(updatePostArray), for: .valueChanged)
        timer()
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.myTimer?.invalidate()
        self.myTimer = nil
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            ProfileViewController.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ProfileViewController.tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ProfileViewController.tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ProfileViewController.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func updatePostArray() {
        print("Количество постов в ленте до обновления данных - \(postArray.count)")
        postArray.append(post1)
        print("Количество постов в ленте после обновления данных - \(postArray.count)")
        ProfileViewController.tableView.reloadData()
        ProfileViewController.tableView.refreshControl?.endRefreshing()
        print("данные успешно обновлены")
    }
    
}
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return postArray.count
        } else {
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1{
            let cell = ProfileViewController.tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.configureCell(title: postArray[indexPath.row].author,
                               image: postArray[indexPath.row].image,
                               description: postArray[indexPath.row].description,
                               likes: postArray[indexPath.row].likes,
                               views: postArray[indexPath.row].views)
            return cell
        } else {
            let cell = ProfileViewController.tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifire, for: indexPath) as! PhotosTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHeaderView.identifire) as! ProfileTableHeaderView
            
            return headerView
        } else { return nil }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 255
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
}
