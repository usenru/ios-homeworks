//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Admin on 02.02.23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let firstVC = FeedViewController()
    let secondVC = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let firstNavigationController = UINavigationController(rootViewController: firstVC)
        let secondNavigationController = UINavigationController(rootViewController: secondVC)
        
        firstVC.tabBarItem.title = "Лента"
        firstVC.tabBarItem.image = UIImage(systemName: "newspaper.fill")
        
        secondVC.tabBarItem.title = "Профиль"
        secondVC.tabBarItem.image = UIImage(systemName: "person.text.rectangle.fill")
        
        viewControllers = [firstNavigationController, secondNavigationController]
        
        
    }
    



}
