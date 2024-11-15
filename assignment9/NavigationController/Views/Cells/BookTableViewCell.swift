//
//  BookTableViewCell.swift
//  NavigationController
//
//  Created by Сабир Глаждин on 15.11.2024.
//

import UIKit

class BookTableViewCell: UITableViewCell {

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
    
    func configure(with book: Book) {
        titleLabel?.text = book.title
        coverImage?.image = book.coverImage
    }
    
}
