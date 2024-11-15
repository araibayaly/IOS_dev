//
//  MovieTableViewCell.swift
//  NavigationController
//
//  Created by Сабир Глаждин on 15.11.2024.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie) {
        titleLabel?.text = movie.title
        coverImage?.image = movie.coverImage
    }
}
