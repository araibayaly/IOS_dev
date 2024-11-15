//
//  MusicTableViewController.swift
//  NavigationController
//

import UIKit

class MusicTableViewController: UITableViewController {
    
    let musicTracks: [Music] = [
        Music(title: "Bohemian Rhapsody",
              coverImage: UIImage(named: "bohemianrhapsody") ?? UIImage(),
              description: "A classic rock opera song by the band Queen.",
              author: "Queen"),
        
        Music(title: "Imagine",
              coverImage: UIImage(named: "imagine") ?? UIImage(),
              description: "A song by John Lennon promoting peace and unity.",
              author: "John Lennon"),
        
        Music(title: "Billie Jean",
              coverImage: UIImage(named: "billiejean") ?? UIImage(),
              description: "One of Michael Jackson's biggest hits from the album Thriller.",
              author: "Michael Jackson"),
        
        Music(title: "Smells Like Teen Spirit",
              coverImage: UIImage(named: "smellsliketeenspirit") ?? UIImage(),
              description: "An iconic grunge anthem by the band Nirvana.",
              author: "Nirvana"),
        
        Music(title: "Hotel California",
              coverImage: UIImage(named: "hotelcalifornia") ?? UIImage(),
              description: "A rock classic by the Eagles with haunting guitar solos.",
              author: "Eagles"),
        
        Music(title: "Shape of You",
              coverImage: UIImage(named: "shapeofyou") ?? UIImage(),
              description: "A pop song by Ed Sheeran that topped global charts.",
              author: "Ed Sheeran"),
        
        Music(title: "Like a Rolling Stone",
              coverImage: UIImage(named: "likearollingstone") ?? UIImage(),
              description: "A song by Bob Dylan that redefined the boundaries of rock.",
              author: "Bob Dylan"),
        
        Music(title: "Rolling in the Deep",
              coverImage: UIImage(named: "rollinginthedeep") ?? UIImage(),
              description: "A soulful song by Adele that won multiple Grammy Awards.",
              author: "Adele"),
        
        Music(title: "Hey Jude",
              coverImage: UIImage(named: "heyjude") ?? UIImage(),
              description: "A timeless song by The Beatles, known for its sing-along chorus.",
              author: "The Beatles"),
        
        Music(title: "Stairway to Heaven",
              coverImage: UIImage(named: "stairwaytoheaven") ?? UIImage(),
              description: "A legendary rock song by Led Zeppelin with a famous guitar solo.",
              author: "Led Zeppelin")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.register(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "MusicTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicTracks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath) as! MusicTableViewCell
        let music = musicTracks[indexPath.row]
        cell.configure(with: music)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailStoryBoard", bundle: nil)
        let musicVC = storyboard.instantiateViewController(withIdentifier: "MusicVC") as! MusicDetailViewController
        let music = musicTracks[indexPath.row]
        musicVC.configure(with: music)
        tableView.deselectRow(at: indexPath, animated: false)
        navigationController?.pushViewController(musicVC, animated: true)
    }
}
