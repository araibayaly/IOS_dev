//
//  musicDetailViewController.swift
//  NavigationController
//

import UIKit

class MusicDetailViewController: UIViewController {
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    var music: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let music = music {
            coverImage?.image = music.coverImage
            titleLabel?.text = music.title
            descriptionLabel?.text = music.description
            authorLabel?.text = music.author
        }

    }
    
    func configure(with music: Music) {
        self.music = music
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
