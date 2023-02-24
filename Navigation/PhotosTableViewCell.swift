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
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
        
        return $0
    }(UILabel())
    
    let arrowLabel: UILabel = {
        $0.font.withSize(12)
        return $0
    }(UILabel())
    
    let photo1ImageView: UIImageView = {
        $0.image = UIImage(named: "iamges-1")
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    let photo2ImageView: UIImageView = {
        $0.image = UIImage(named: "iamges-2")
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    let photo3ImageView: UIImageView = {
        $0.image = UIImage(named: "iamges-3")
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    let photo4ImageView: UIImageView = {
        $0.image = UIImage(named: "iamges-4")
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        return $0
    }(UIImageView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialization()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension PhotosTableViewCell {
    func initialization() {
        NSLayoutConstraint.activate([
        
            photosLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            arrowLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            arrowLabel.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            
            photo1ImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photo1ImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            photo1ImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            photo1ImageView.widthAnchor.constraint(equalToConstant: imagesSize),
            photo1ImageView.heightAnchor.constraint(equalToConstant: imagesSize),
            
            photo2ImageView.leadingAnchor.constraint(equalTo: photo1ImageView.trailingAnchor, constant: 8),
            photo2ImageView.centerYAnchor.constraint(equalTo: photo1ImageView.centerYAnchor),
            photo2ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),
            photo2ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),
            
            photo3ImageView.leadingAnchor.constraint(equalTo: photo2ImageView.trailingAnchor, constant: 8),
            photo3ImageView.centerYAnchor.constraint(equalTo: photo1ImageView.centerYAnchor),
            photo3ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),
            photo3ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),
            
            photo4ImageView.leadingAnchor.constraint(equalTo: photo3ImageView.trailingAnchor, constant: 8),
            photo4ImageView.centerYAnchor.constraint(equalTo: photo1ImageView.centerYAnchor),
            photo4ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),
            photo4ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),
            photo4ImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
            
        ])
    }
}
