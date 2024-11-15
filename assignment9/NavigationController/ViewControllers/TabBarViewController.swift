import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabBar.items?[0].image = UIImage(systemName: "movieclapper.fill")
        tabBar.items?[1].image = UIImage(systemName: "book.fill")
        tabBar.items?[2].image = UIImage(systemName: "music.note")
        
        tabBar.items?[0].title = "Movies"
        tabBar.items?[1].title = "Books"
        tabBar.items?[2].title = "Music"

        tabBar.tintColor = .black
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
