//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Admin on 02.02.23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let feedVC = FeedViewController()
    private let logInVC = LogInViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupControllers()
    }
        
    private func setupControllers() {
        
        let firstNavigationController = UINavigationController(rootViewController: feedVC)
        let loginNavController = UINavigationController(rootViewController: logInVC)
        
        tabBar.backgroundColor = .white
        tabBar.alpha = 0.5
        
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "house.fill")
        
        logInVC.tabBarItem.title = "Профиль"
        logInVC.title = "Профиль"
        logInVC.tabBarItem.image = UIImage(systemName: "person.fill")
        
        viewControllers = [firstNavigationController, loginNavController]
        
    }

}
