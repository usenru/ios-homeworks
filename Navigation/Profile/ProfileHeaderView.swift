//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Admin on 08.02.23.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemPink
        image.image = UIImage(named: "Cat")
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 75
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    let button: UIButton = {
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
    
    let nameLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
        $0.text = "Hipster Cat"
        return $0
    }(UILabel())
    
    let textLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
        $0.text = "Waiting for something"

        return $0
    }(UILabel())
    
    let textField: UITextField = {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .black
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        return $0
    }(UITextField())
    
    
    func addViews() {
        addSubview(imageView)
        addSubview(button)
        addSubview(nameLabel)
        addSubview(textLabel)
        addSubview(textField)
    }
    
    
    
    
    
}
