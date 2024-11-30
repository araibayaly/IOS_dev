import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json"
    
    func fetchSuperheroes(completion: @escaping (Result<[Superhero], Error>) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let superheroes = try JSONDecoder().decode([Superhero].self, from: data)
                print(superheroes)
                completion(.success(superheroes))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
