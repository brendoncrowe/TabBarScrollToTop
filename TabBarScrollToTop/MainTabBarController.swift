//
//  MainTabBat.swift
//  TabBarScrollToTop
//
//  Created by Brendon Crowe on 5/8/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
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
    }
}
