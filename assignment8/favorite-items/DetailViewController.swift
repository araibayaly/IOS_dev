//
//  DetailViewController.swift
//  favorite-items
//
//  Created by Arai Bayaly on 07.11.2024.
//

import UIKit

class DetailViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .label
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        view.backgroundColor = .white
    }
    
    func setupUI() {
        [titleLabel, descriptionLabel, imageView].forEach(view.addSubview)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textAlignment = .center
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .init(32)),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .init(16)),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: .init(-16)),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: .init(32)),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .init(32)),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .init(16)),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .init(-16)),
        ])
    }
    
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.name
        descriptionLabel.text = item.description
        imageView.image = UIImage(named: item.image)
    }
}
