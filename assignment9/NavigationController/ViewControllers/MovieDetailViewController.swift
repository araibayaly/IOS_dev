//
//  MovieDetailViewController.swift
//  NavigationController
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            coverImage?.image = movie.coverImage
            titleLabel?.text = movie.title
            descriptionLabel?.text = movie.description
            authorLabel?.text = movie.author
        }

    }
    
    func configure(with movie: Movie) {
        self.movie = movie
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
