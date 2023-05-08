//
//  MainTabBat.swift
//  TabBarScrollToTop
//
//  Created by Brendon Crowe on 5/8/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private static let notificationName = Notification.Name(rawValue: "HomeControllerTapped")
    
    private lazy var homeController: UIViewController = {
        let controller = UINavigationController(rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        controller.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house")?.withBaselineOffset(fromBottom: UIFont.systemFontSize + 6), tag: 0)
        return controller
    }()
    
    private lazy var settingsController: UIViewController = {
        let controller = UINavigationController(rootViewController: SettingsViewController())
        controller.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gear")?.withBaselineOffset(fromBottom: UIFont.systemFontSize + 6), tag: 1)
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeController, settingsController]
        tabBar.backgroundColor = .systemGray6
        self.delegate = self
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let navController = tabBarController.viewControllers?.first as? UINavigationController, let homeController = navController.viewControllers.first as? HomeViewController else { return }
        let index = viewControllers?.firstIndex(of: viewController)
        if index == 0 {
            if homeController.canScroll == true {
                NotificationCenter.default.post(name: MainTabBarController.notificationName, object: nil)
            }
        }
    }
}
