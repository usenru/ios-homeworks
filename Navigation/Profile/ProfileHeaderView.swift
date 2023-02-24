//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Admin on 08.02.23.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private let avatarImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "Cat")
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.cornerRadius = 75
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let setStatusButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .link
        $0.setTitle("Show status", for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 4
        $0.layer.shadowOffset = CGSize(width: 4, height: 4)
        $0.layer.shadowRadius = 4
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.7
        return $0
    }(UIButton())
    
    private let fullNameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
        $0.text = "Hipster Cat"
        return $0
    }(UILabel())
    
    private let statusLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
        $0.text = "Waiting for something"

        return $0
    }(UILabel())
    
    private lazy var statusTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.indent(size: 10)
        $0.delegate = self
        $0.textColor = .black
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        return $0
    }(UITextField())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func  initialization() {
        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        backgroundColor = .white
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        NSLayoutConstraint.activate([
        
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        avatarImageView.heightAnchor.constraint(equalToConstant: 150),
        avatarImageView.widthAnchor.constraint(equalToConstant: 150),
        
        fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
        fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
        fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
        setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        
        statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -74),
        statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
        statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      
        statusTextField.heightAnchor.constraint(equalToConstant: 40),
        statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
        statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16)
        
        ])
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
//        let profileVC = ProfileViewController()
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusTextField.text
        print("\(statusLabel.text ?? "")")
    }
  
}


extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
