//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Ruslan Usen on 25.02.2023.
//

import UIKit

protocol PhotosCollectionViewDelegate: AnyObject {
    func didTapImage(_ image: UIImage, imageRect: CGRect)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: PhotosCollectionViewDelegate?
    
    var image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGesture() {
        let tapImageGesture = UITapGestureRecognizer(target: self, action: #selector(tapImageAction))
        image.addGestureRecognizer(tapImageGesture)
    }
    
    @objc private func tapImageAction() {
        print("111")
        delegate?.didTapImage(image.image!, imageRect: image.frame)
    }
    
    private func layout() {
        addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
