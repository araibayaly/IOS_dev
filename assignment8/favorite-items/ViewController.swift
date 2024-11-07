//
//  ViewController.swift
//  favorite-items
//
//  Created by Arai Bayaly on 07.11.2024.
//

import UIKit

final class ViewController: UIViewController {
    let favoritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavoritesCell.self, forCellReuseIdentifier: "FavoriteCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var favorites: [FavoriteItem] = [
        .init(id: 1, name: "Apple", image: "apple", description: "Red apple"),
        .init(id: 2, name: "Banana", image: "banana", description: "Yellow banana"),
        .init(id: 3, name: "Orange", image: "orange", description: "Orange"),
        .init(id: 4, name: "Pear", image: "pear", description: "Pear"),
        .init(id: 5, name: "Strawberry", image: "strawberry", description: "Strawberry"),
        .init(id: 6, name: "Watermelon", image: "watermelon", description: "Watermelon"),
        .init(id: 7, name: "Cherry", image: "cherry", description: "Cherry"),
        .init(id: 8, name: "Grape", image: "grape", description: "Grape"),
        .init(id: 9, name: "Kiwi", image: "kiwi", description: "Kiwi"),
        .init(id: 10, name: "Pineapple", image: "pineapple", description: "Pineapple")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(favoritesTableView)
        
        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            favoritesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            favoritesTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoritesCell else { return UITableViewCell() }
        
        cell.textLabel?.text = favorites[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.configure(with: favorites[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

