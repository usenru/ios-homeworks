//
//  ViewController.swift
//  Navigation
//
//  Created by Admin on 02.02.23.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    private let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView())
    
    private let firstButton: UIButton = {
        $0.setTitle("First Button", for: .normal)
        $0.backgroundColor = .link
        $0.tintColor = .white
        $0.layer.cornerRadius = 4
        $0.layer.shadowOffset = CGSize(width: 4, height: 4)
        $0.layer.shadowRadius = 4
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.7
        return $0
    }(UIButton())
    
    private let secondButton: UIButton = {
        $0.setTitle("Second Button", for: .normal)
        $0.backgroundColor = .link
        $0.backgroundColor = .link
        $0.tintColor = .white
        $0.layer.cornerRadius = 4
        $0.layer.shadowOffset = CGSize(width: 4, height: 4)
        $0.layer.shadowRadius = 4
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.7


        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        layout()
        firstButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)

    }
    
    private func layout() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
    }
    
    @objc private func tapAction() {
        
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
        
    }

  

}

