

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let tabbarController = UITabBarController ()
        
        let feedItem = UITabBarItem()
        feedItem.title = "Лента новостей"
        feedItem.image = UIImage (systemName: "list.dash")
        let feed = FeedViewController()
        feed.title = "News"
        let navigationController = UINavigationController (rootViewController: feed)
        feed.tabBarItem = feedItem
        
        let profileItem = UITabBarItem()
        profileItem.title = "Профиль"
        profileItem.image = UIImage (systemName: "person.fill")
        let profile = LoginViewController()
        profile.title = "Profile"
        let pfNavigationcontroller = UINavigationController(rootViewController: profile)
        profile.tabBarItem = profileItem
        
        tabbarController.viewControllers = [navigationController, pfNavigationcontroller]
        tabbarController.selectedIndex = 0
        
        let loginVC = LoginViewController()
        let factory = MyLoginFactory()
        let inspector = factory.createLoginInspector()
        loginVC.delegate = inspector
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        createPhotosArray()
        return true
    }
}


