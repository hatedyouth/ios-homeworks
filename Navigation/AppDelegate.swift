

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
        feed.tabBarItem = feedItem
        
        
        let profileItem = UITabBarItem()
        profileItem.title = "Профиль"
        profileItem.image = UIImage (systemName: "person.fill")
        let profile = ProfileViewController()
        profile.tabBarItem = profileItem
        
        tabbarController.viewControllers = [feed, profile]
        tabbarController.selectedViewController = feed
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        
        return true
    }
    
    
    
    
}

