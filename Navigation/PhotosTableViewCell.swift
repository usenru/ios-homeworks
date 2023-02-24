//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Ruslan Usen on 24.02.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let imagesSize = (UIScreen.main.bounds.width - 48) / 4
    
    // MARK: - Private properties
    let photosLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Photos"
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
        
        return $0
    }(UILabel())
    
    let arrowImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "arrow.right")
        $0.tintColor = .black
        return $0
    }(UIImageView())
    
    let photo1ImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "images-1")
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    let photo2ImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "images-2")
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    let photo3ImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "images-3")
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    let photo4ImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "images-4")
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 8
        return $0
    }(UIStackView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(photosLabel)
        addSubview(arrowImageView)
        addSubview(stackView)
        [photo1ImageView, photo2ImageView, photo3ImageView, photo4ImageView].forEach {
            stackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
        
            photosLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            arrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
          
            photo1ImageView.widthAnchor.constraint(equalToConstant: imagesSize),
            photo1ImageView.heightAnchor.constraint(equalToConstant: imagesSize),
       
            photo2ImageView.widthAnchor.constraint(equalTo: photo1ImageView.widthAnchor),
            photo2ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),
            
 
            photo3ImageView.widthAnchor.constraint(equalTo: photo1ImageView.widthAnchor),
            photo3ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),
            
            photo4ImageView.widthAnchor.constraint(equalTo: photo1ImageView.widthAnchor),
            photo4ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor)
            
        ])
    }

}

