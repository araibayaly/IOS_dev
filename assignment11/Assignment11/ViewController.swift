import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    private let nameLabel = UILabel()
        private let attributesLabel = UILabel()
        private let imageView = UIImageView()
        private let randomizeButton = UIButton(type: .system)

        // MARK: - Properties
        private let apiUrl = "https://akabab.github.io/superhero-api/api/all.json"
        private var superheroes: [Superhero] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            fetchSuperheroes()
        }

        // MARK: - UI Setup
        private func setupUI() {
            view.backgroundColor = .white

            // Name Label
            nameLabel.font = .boldSystemFont(ofSize: 24)
            nameLabel.textAlignment = .center
            nameLabel.translatesAutoresizingMaskIntoConstraints = false

            // Attributes Label
            attributesLabel.numberOfLines = 0
            attributesLabel.font = .systemFont(ofSize: 16)
            attributesLabel.translatesAutoresizingMaskIntoConstraints = false

            // Image View
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false

            // Randomize Button
            randomizeButton.setTitle("Randomize", for: .normal)
            randomizeButton.addTarget(self, action: #selector(randomizeTapped), for: .touchUpInside)
            randomizeButton.translatesAutoresizingMaskIntoConstraints = false

            // Adding subviews
            view.addSubview(nameLabel)
            view.addSubview(attributesLabel)
            view.addSubview(imageView)
            view.addSubview(randomizeButton)

            // Layout
            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 200),
                imageView.widthAnchor.constraint(equalToConstant: 200),

                attributesLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                attributesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                attributesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

                randomizeButton.topAnchor.constraint(equalTo: attributesLabel.bottomAnchor, constant: 20),
                randomizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }

        // MARK: - Networking
        private func fetchSuperheroes() {
            AF.request(apiUrl).responseDecodable(of: [Superhero].self) { response in
                switch response.result {
                case .success(let heroes):
                    self.superheroes = heroes
                    self.displayRandomSuperhero()
                case .failure(let error):
                    self.showError(message: "Failed to fetch superheroes: \(error.localizedDescription)")
                }
            }
        }

        // MARK: - Randomize Button Action
        @objc private func randomizeTapped() {
            displayRandomSuperhero()
        }

        private func displayRandomSuperhero() {
            guard !superheroes.isEmpty else {
                showError(message: "No superheroes available.")
                return
            }

            let randomHero = superheroes.randomElement()!
            updateUI(with: randomHero)
        }

        // MARK: - Update UI
        private func updateUI(with hero: Superhero) {
            nameLabel.text = hero.name
            attributesLabel.text = """
            Full Name: \(hero.biography?.fullName ?? "Empty")
            Intelligence: \(hero.powerstats?.intelligence ?? -1)
            Strength: \(hero.powerstats?.strength ?? -1)
            Speed: \(hero.powerstats?.speed ?? -1)
            Gender: \(hero.appearance?.gender ?? "Non binary")
            Race: \(hero.appearance?.race ?? "Unknown race")
            Height: \(hero.appearance?.height?[1] ?? "") 
            Work: \(hero.work?.occupation ?? "No work")
            Publisher: \(hero.biography?.publisher ?? "No publisher")
            """

            if let url = URL(string: hero.images!.lg) {
                imageView.kf.setImage(with: url)
            }
        }

        // MARK: - Error Handling
        private func showError(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }

}

