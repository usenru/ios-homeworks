//
//  InfoViewController.swift
//  Navigation
//
//  Created by Admin on 02.02.23.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let infoButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Нажать", for: .normal)
        button.backgroundColor = .darkGray
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        view.addSubview(infoButton)
        setupButton()
        
    }
    
    private func setupButton() {
        infoButton.center = view.center
        infoButton.layer.cornerRadius = 20
        infoButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc private func tapAction() {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("Вы нажали кнопку Ок")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            print("Вы нажали кнопку Cancel")
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }

}
