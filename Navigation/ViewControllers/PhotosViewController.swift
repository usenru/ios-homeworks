//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Ruslan Usen on 25.02.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let images = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    
    private let collectionViewCell = PhotosCollectionViewCell()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))
        return collectionView
    }()
    
    private let whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0.7
        return view
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 66, y: 80, width: 50, height: 50))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(crossButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.alpha = 0
        return imageView
    }()
    
    private var initialImageRect: CGRect = .zero
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    @objc private func crossButtonAction() {
        crossButton.removeFromSuperview()
        whiteView.removeFromSuperview()
        animateImageToInitial(rect: initialImageRect)
    }
    
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.5) {
            self.animatingImageView.frame = rect
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
        }
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(whiteView)
        view.addSubview(animatingImageView)
        animatingImageView.image = image
        animatingImageView.alpha = 1.0
        animatingImageView.frame = imageFrame
        
        UIView.animate(withDuration: 0.5) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.view.addSubview(self.crossButton)
            }
           
        }
    }
    
    
    func layout() {
            view.addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
}
// MARK: - UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        cell.image.image = UIImage(named: images[indexPath.item])
        cell.delegate = self
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 8 * 4 ) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: .zero, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
}

extension PhotosViewController: PhotosCollectionViewDelegate {
    func didTapImage(_ image: UIImage, imageRect: CGRect) {
        let rect = collectionViewCell.frame
        let currentHeaderRect = collectionView.convert(rect, to: view)
        initialImageRect = CGRect(x: imageRect.origin.x,
                                  y: imageRect.origin.y + currentHeaderRect.origin.y,
                                  width: imageRect.width,
                                  height: imageRect.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
    
}
