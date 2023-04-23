//
//  PostViewController.swift
//  Navigation
//
//  Created by Admin on 02.02.23.
//

import UIKit

class PostViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        makeBarItem()
    }
    
    private func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barItem
    }
                                      
    @objc private func barItemAction() {
        let infoVC = InfoViewController()
        infoVC.title = "Инфо"
        present(infoVC, animated: true)
    }

}
