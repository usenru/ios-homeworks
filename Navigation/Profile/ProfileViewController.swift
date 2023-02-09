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
    private var statusText: String! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        profileHeaderView.setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileHeaderView.statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        layout()
    }
    
    
    
    
    @objc func buttonPressed() {
        print("\(profileHeaderView.statusLabel.text ?? "")")
        profileHeaderView.statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    private func layout() {
        view.addSubview(profileHeaderView)
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            profileHeaderView.avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileHeaderView.avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileHeaderView.avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            profileHeaderView.avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            
            profileHeaderView.fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            profileHeaderView.fullNameLabel.leadingAnchor.constraint(equalTo: profileHeaderView.avatarImageView.trailingAnchor, constant: 16),
            profileHeaderView.fullNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            profileHeaderView.setStatusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileHeaderView.setStatusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            profileHeaderView.setStatusButton.topAnchor.constraint(equalTo: profileHeaderView.avatarImageView.bottomAnchor, constant: 16),
            profileHeaderView.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            profileHeaderView.statusLabel.bottomAnchor.constraint(equalTo: profileHeaderView.setStatusButton.topAnchor, constant: -74),
            profileHeaderView.statusLabel.leadingAnchor.constraint(equalTo: profileHeaderView.avatarImageView.trailingAnchor, constant: 16),
            profileHeaderView.statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
          
            profileHeaderView.statusTextField.heightAnchor.constraint(equalToConstant: 40),
            profileHeaderView.statusTextField.leadingAnchor.constraint(equalTo: profileHeaderView.avatarImageView.trailingAnchor, constant: 16),
            profileHeaderView.statusTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            profileHeaderView.statusTextField.bottomAnchor.constraint(equalTo: profileHeaderView.setStatusButton.topAnchor, constant: -16)
        ])
    }
    

}
