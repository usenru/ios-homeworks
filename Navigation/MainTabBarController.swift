//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Admin on 02.02.23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let feedVC = FeedViewController()
    private let profileVC = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupControllers()
        
        
    }
    
    
    
    private func setupControllers() {
        
        let firstNavigationController = UINavigationController(rootViewController: feedVC)
        let secondNavigationController = UINavigationController(rootViewController: profileVC)
        
        tabBar.backgroundColor = .white
        tabBar.alpha = 0.5
        
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "newspaper.fill")
        
        profileVC.tabBarItem.title = "Профиль"
        profileVC.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.text.rectangle.fill")
        
        viewControllers = [firstNavigationController, secondNavigationController]
        
    }
    
    
    



}
