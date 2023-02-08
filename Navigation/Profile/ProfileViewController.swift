//
//  SecondViewController.swift
//  Navigation
//
//  Created by Admin on 02.02.23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let screenWidth = UIScreen.main.bounds.width
    private let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        profileHeaderView.addViews()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        profileHeaderView.frame = view.frame
        profileHeaderView.imageView.frame = CGRect(x: 16, y: view.safeAreaInsets.top + 16, width: 150, height: 150)
        profileHeaderView.button.frame = CGRect(x: 16, y: view.safeAreaInsets.top + profileHeaderView.imageView.bounds.height + 32, width: screenWidth - 32, height: 50)
        profileHeaderView.nameLabel.frame = CGRect(x: Int(profileHeaderView.imageView.bounds.width) + 32, y: Int(view.safeAreaInsets.top) + 27, width: Int(screenWidth - profileHeaderView.imageView.bounds.width) - 48, height: 50)
        profileHeaderView.textLabel.frame = CGRect(x: Int(profileHeaderView.imageView.bounds.width) + 32, y: Int(view.safeAreaInsets.top + profileHeaderView.imageView.bounds.height) - 52, width: Int(screenWidth - profileHeaderView.imageView.bounds.width) - 48, height: 50)
    }

}
