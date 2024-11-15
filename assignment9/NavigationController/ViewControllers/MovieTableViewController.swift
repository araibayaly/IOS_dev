//
//  MovieTableViewController.swift
//  NavigationController
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    let movies: [Movie] = [
        Movie(title: "Inception",
              coverImage: UIImage(named: "inception") ?? UIImage(),
              description: "A thief who steals corporate secrets through dream-sharing technology is given a chance to have his criminal history erased.",
              author: "Christopher Nolan"),
        
        Movie(title: "The Matrix",
              coverImage: UIImage(named: "matrix") ?? UIImage(),
              description: "A computer hacker learns about the true nature of reality and his role in the war against its controllers.",
              author: "Lana Wachowski, Lilly Wachowski"),
        
        Movie(title: "Interstellar",
              coverImage: UIImage(named: "interstellar") ?? UIImage(),
              description: "A team of explorers travel through a wormhole in space in an attempt to save humanity.",
              author: "Christopher Nolan"),
        
        Movie(title: "The Shawshank Redemption",
              coverImage: UIImage(named: "shawshank") ?? UIImage(),
              description: "Two imprisoned men bond over several years, finding solace and eventual redemption through acts of common decency.",
              author: "Frank Darabont"),
        
        Movie(title: "Pulp Fiction",
              coverImage: UIImage(named: "pulpfiction") ?? UIImage(),
              description: "The lives of two mob hitmen, a boxer, a gangster and his wife intertwine in four tales of violence and redemption.",
              author: "Quentin Tarantino"),
        
        Movie(title: "The Dark Knight",
              coverImage: UIImage(named: "darkknight") ?? UIImage(),
              description: "When the Joker emerges from his mysterious past, he wreaks havoc on Gotham City, pushing Batman to his limits.",
              author: "Christopher Nolan"),
        
        Movie(title: "Fight Club",
              coverImage: UIImage(named: "fightclub") ?? UIImage(),
              description: "An insomniac office worker forms an underground fight club as a form of male bonding and a release from societal constraints.",
              author: "David Fincher"),
        
        Movie(title: "Forrest Gump",
              coverImage: UIImage(named: "forrestgump") ?? UIImage(),
              description: "The story of a slow-witted but kind-hearted man as he navigates major historical events in the 20th century.",
              author: "Robert Zemeckis"),
        
        Movie(title: "The Godfather",
              coverImage: UIImage(named: "godfather") ?? UIImage(),
              description: "The aging patriarch of an organized crime dynasty transfers control of his empire to his reluctant son.",
              author: "Francis Ford Coppola"),
        
        Movie(title: "Schindler's List",
              coverImage: UIImage(named: "schindlerslist") ?? UIImage(),
              description: "In Nazi-occupied Poland, a businessman gradually becomes concerned for his Jewish workforce after witnessing persecution.",
              author: "Steven Spielberg")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        
        
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailStoryBoard", bundle: nil)
        let movieVC = storyboard.instantiateViewController(withIdentifier: "MovieVC") as! MovieDetailViewController
        let movie = movies[indexPath.row]
        movieVC.configure(with: movie)
        tableView.deselectRow(at: indexPath, animated: false)
        navigationController?.pushViewController(movieVC, animated: true)
    }
    
}
