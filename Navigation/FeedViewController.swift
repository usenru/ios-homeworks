//
//  ViewController.swift
//  Navigation
//
//  Created by Admin on 02.02.23.
//

import UIKit

class FeedViewController: UIViewController {
    
    let newPost = Post(title: "Информация")
    
    private let showPostButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.setTitle("Показать пост", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupButton()

    }
    
    private func setupButton() {
        view.addSubview(showPostButton)
        showPostButton.center = view.center
        showPostButton.layer.cornerRadius = 20
        showPostButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }

    @objc private func tapAction() {
        let postVC = PostViewController()
        postVC.title = newPost.title
        navigationController?.pushViewController(postVC, animated: true)
    }

}

