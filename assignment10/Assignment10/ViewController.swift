import UIKit

class ViewController: UIViewController {

    private var superheroes: [Superhero] = []
       
       private let randomButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Randomize", for: .normal)
           return button
       }()
       
       private let nameLabel = UILabel()
       private let imageView = UIImageView()
       private let attributesLabel = UILabel()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           setupUI()
           fetchSuperheroes()
       }
       
       private func setupUI() {
           view.addSubview(randomButton)
           view.addSubview(nameLabel)
           view.addSubview(imageView)
           view.addSubview(attributesLabel)
           
           // Настройка Auto Layout
           randomButton.translatesAutoresizingMaskIntoConstraints = false
           randomButton.addTarget(self, action: #selector(randomizeSuperhero), for: .touchUpInside)
           nameLabel.translatesAutoresizingMaskIntoConstraints = false
           imageView.translatesAutoresizingMaskIntoConstraints = false
           attributesLabel.translatesAutoresizingMaskIntoConstraints = false
           attributesLabel.numberOfLines = 0
           
           NSLayoutConstraint.activate([
               randomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               randomButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
               
               imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               imageView.topAnchor.constraint(equalTo: randomButton.bottomAnchor, constant: 20),
               imageView.widthAnchor.constraint(equalToConstant: 200),
               imageView.heightAnchor.constraint(equalToConstant: 200),
               
               nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
               nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               
               attributesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
               attributesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               attributesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           ])
       }
       
       private func fetchSuperheroes() {
           NetworkManager.shared.fetchSuperheroes { [weak self] result in
               DispatchQueue.main.async {
                   switch result {
                   case .success(let heroes):
                       self?.superheroes = heroes
                       self?.updateUI(with: self?.superheroes.first)
                   case .failure(let error):
                       self?.showError(error.localizedDescription)
                   }
               }
           }
       }
       
       @objc private func randomizeSuperhero() {
           guard !superheroes.isEmpty else {
               showError("No superheroes available.")
               return
           }
           
           let randomHero = superheroes.randomElement()!
           updateUI(with: randomHero)
       }
       
       private func updateUI(with hero: Superhero?) {
           guard let hero = hero else {
               return
           }
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
           
           if let url = URL(string: hero.images!.md) {
               loadImage(from: url)
           }
       }
       
       private func loadImage(from url: URL) {
           URLSession.shared.dataTask(with: url) { data, response, error in
               guard let data = data, let image = UIImage(data: data) else { return }
               DispatchQueue.main.async {
                   self.imageView.image = image
               }
           }.resume()
       }
       
       private func showError(_ message: String) {
           let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default))
           present(alert, animated: true)
       }

}

