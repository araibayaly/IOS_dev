//
//  MusicTableViewCell.swift
//  NavigationController
//
//  Created by Сабир Глаждин on 15.11.2024.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with music: Music) {
        titleLabel?.text = music.title
        coverImage?.image = music.coverImage
    }
}
