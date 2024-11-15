//
//  bookDetailViewController.swift
//  NavigationController
//

import UIKit

class BookDetailViewController: UIViewController {
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let book = book {
            coverImage?.image = book.coverImage
            titleLabel?.text = book.title
            descriptionLabel?.text = book.description
            authorLabel?.text = book.author
        }

    }
    
    func configure(with book: Book) {
        self.book = book
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
