//
//  SecondViewController.swift
//  Navigation
//
//  Created by Admin on 02.02.23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        return tableView
    }()
    
    private let whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0.7
        return view
    }()
    
    private var initialImageRect: CGRect = .zero
    
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
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        $0.alpha = 0
        $0.numberOfLines = 0
        $0.backgroundColor = .systemGray6
        return $0
    }(UILabel())

    let headerTableView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    @objc private func crossButtonAction() {
        crossButton.removeFromSuperview()
        whiteView.removeFromSuperview()
        descriptionLabel.removeFromSuperview()
        animateImageToInitial(rect: initialImageRect)
    }
    
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.5) {
            self.animatingImageView.frame = rect
            self.animatingImageView.layer.cornerRadius = 75
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
    
    private func showDescription(_ description: String) {
        view.addSubview(whiteView)
        view.addSubview(descriptionLabel)
        descriptionLabel.text = description
        descriptionLabel.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                    height: UIScreen.main.bounds.width)
        descriptionLabel.center = self.view.center
        
        UIView.animate(withDuration: 1) {
            self.descriptionLabel.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.view.addSubview(self.crossButton)
            }
           
        }
        
    }
    
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        self.tableView.rowHeight = UITableView.automaticDimension
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return ProfileViewController.postArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(post: ProfileViewController.postArray[indexPath.row])
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            headerTableView.delegate = self
            return headerTableView

        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 0
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photoVC = PhotosViewController()
            navigationController?.pushViewController(photoVC, animated: true)
            navigationController?.navigationBar.isHidden = false
            photoVC.title = "Photo Gallery"
        }
    }
}

extension ProfileViewController: ProfileHeaderDelegate, PostTableViewDelegate {
    
    
    func didTapImage(_ image: UIImage, imageRect: CGRect) {
        let rect = headerTableView.frame
        let currentHeaderRect = tableView.convert(rect, to: view)
        initialImageRect = CGRect(x: imageRect.origin.x,
                                  y: imageRect.origin.y + currentHeaderRect.origin.y,
                                  width: imageRect.width,
                                  height: imageRect.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
    
    func didTapPost(_ description: String) {
        showDescription(description)
    }
}

extension ProfileViewController {
    static var postArray = [Post(author: "Kinopoisk", description: "\"Падение луны\" - это фантастический фильм о группе астронавтов, которые отправляются на луну, чтобы разместить на ее поверхности новую базу. В процессе своей миссии они обнаруживают, что луна начинает уходить с орбиты и скоро столкнется с Землей, вызывая катастрофические последствия.Астронавты пытаются понять причину этого необъяснимого явления, и в их поисках им приходится столкнуться с различными опасностями и трудностями. В ходе своих приключений они обнаруживают, что на луне находится таинственный объект, который, возможно, может остановить движение луны и предотвратить катастрофу. Фильм \"Падение луны\" является захватывающим научно-фантастическим боевиком, который предлагает зрителю увлекательное приключение и множество впечатляющих визуальных эффектов.", image: "falle_moonn", likes: 0, views: 0),
                            Post(author: "Kinopoisk", description: "\"На картах не значится\" - приключенческий боевик о том, как неудачливый охотник за сокровищами Натан Дрейк отправляется на поиски легендарного города, известного как Эльдорадо, вместе с коварным партнером и загадочной девушкой-исследователем. Но они сталкиваются с сильными противниками и опасностями, которые угрожают не только их жизни, но и будущему человечества.", image: "ancharted", likes: 0, views: 0),
                            Post(author: "GTA Online", description: "GTA (Grand Theft Auto) - игра в жанре открытого мира, где игрок в роли преступника взаимодействует с городом и выполняет различные задания. Игрок может перемещаться на автомобилях, мотоциклах, лодках и самолетах, общаться с другими персонажами и использовать оружие. В игре присутствует реалистичная графика и множество возможностей для свободного действия в игровом мире.", image: "gta", likes: 0, views: 0),
                            Post(author: "Subway Surf", description: "\"Subway Surf\" - бесконечный раннер, где игроки играют за персонажа, бегущего по железнодорожным путям, избегая препятствий и собирая монеты, с целью продержаться как можно дольше.", image: "surf", likes: 0, views: 0)
    ]
}
