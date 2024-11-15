//
//  BooksTableViewController.swift
//  NavigationController
//

import UIKit

class BooksTableViewController: UITableViewController {

    let books: [Book] = [
        Book(title: "To Kill a Mockingbird",
             coverImage: UIImage(named: "tokillamockingbird") ?? UIImage(),
             author: "Harper Lee",
             description: "A novel about the serious issues of rape and racial inequality, told through the eyes of young Scout Finch."),
        
        Book(title: "1984",
             coverImage: UIImage(named: "1984") ?? UIImage(),
             author: "George Orwell",
             description: "A dystopian novel set in a totalitarian society under constant surveillance."),
        
        Book(title: "The Great Gatsby",
             coverImage: UIImage(named: "thegreatgatsby") ?? UIImage(),
             author: "F. Scott Fitzgerald",
             description: "A story of the wealthy Jay Gatsby and his love for Daisy Buchanan during the Jazz Age."),
        
        Book(title: "Pride and Prejudice",
             coverImage: UIImage(named: "prideandprejudice") ?? UIImage(),
             author: "Jane Austen",
             description: "A romantic novel that explores the issues of love, class, and reputation."),
        
        Book(title: "The Catcher in the Rye",
             coverImage: UIImage(named: "thecatcherintherye") ?? UIImage(),
             author: "J.D. Salinger",
             description: "A narrative of teenage rebellion and alienation, following the life of Holden Caulfield."),
        
        Book(title: "The Hobbit",
             coverImage: UIImage(named: "thehobbit") ?? UIImage(),
             author: "J.R.R. Tolkien",
             description: "A fantasy adventure novel about Bilbo Baggins' journey through Middle-earth."),
        
        Book(title: "Moby-Dick",
             coverImage: UIImage(named: "mobydick") ?? UIImage(),
             author: "Herman Melville",
             description: "A novel about Captain Ahab's obsessive quest to kill the giant white whale, Moby Dick."),
        
        Book(title: "War and Peace",
             coverImage: UIImage(named: "warandpeace") ?? UIImage(),
             author: "Leo Tolstoy",
             description: "An epic novel that follows the lives of several families during the Napoleonic Wars."),
        
        Book(title: "The Odyssey",
             coverImage: UIImage(named: "theodyssey") ?? UIImage(),
             author: "Homer",
             description: "An ancient Greek epic following Odysseus' journey home after the Trojan War."),
        
        Book(title: "Crime and Punishment",
             coverImage: UIImage(named: "crimeandpunishment") ?? UIImage(),
             author: "Fyodor Dostoevsky",
             description: "A psychological novel about the moral dilemmas faced by a young man after committing a murder.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        let book = books[indexPath.row]
        cell.configure(with: book)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailStoryBoard", bundle: nil)
        let bookVC = storyboard.instantiateViewController(withIdentifier: "BookVC") as! BookDetailViewController
        let book = books[indexPath.row]
        bookVC.configure(with: book)
        tableView.deselectRow(at: indexPath, animated: false)
        navigationController?.pushViewController(bookVC, animated: true)
    }
    
}
