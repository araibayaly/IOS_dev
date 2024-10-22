
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer: Timer?
    var totalTime = 0
    var secondsPassed = 0
    var audioPlayer: AVAudioPlayer?
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720] // Egg durations in seconds
    var selectedEggTime = 0
    
    let progressBar = UIProgressView(progressViewStyle: .default)
    let timeLabel = UILabel()
    let softEggImageView = UIImageView(image: UIImage(named: "soft"))
    let mediumEggImageView = UIImageView(image: UIImage(named: "medium"))
    let hardEggImageView = UIImageView(image: UIImage(named: "hard"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        softEggImageView.isUserInteractionEnabled = true
        mediumEggImageView.isUserInteractionEnabled = true
        hardEggImageView.isUserInteractionEnabled = true
        
        softEggImageView.contentMode = .scaleAspectFit
        mediumEggImageView.contentMode = .scaleAspectFit
        hardEggImageView.contentMode = .scaleAspectFit
        
        let softTapGesture = UITapGestureRecognizer(target: self, action: #selector(eggTapped(_:)))
        softEggImageView.addGestureRecognizer(softTapGesture)
        
        let mediumTapGesture = UITapGestureRecognizer(target: self, action: #selector(eggTapped(_:)))
        mediumEggImageView.addGestureRecognizer(mediumTapGesture)
        
        let hardTapGesture = UITapGestureRecognizer(target: self, action: #selector(eggTapped(_:)))
        hardEggImageView.addGestureRecognizer(hardTapGesture)
        
        softEggImageView.tag = 1
        mediumEggImageView.tag = 2
        hardEggImageView.tag = 3
        
        timeLabel.text = "00:00"
        timeLabel.font = UIFont.systemFont(ofSize: 52, weight: .bold)
        timeLabel.textAlignment = .center
        
        progressBar.progress = 0.0
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [softEggImageView, mediumEggImageView, hardEggImageView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        view.addSubview(stackView)
        view.addSubview(timeLabel)
        view.addSubview(progressBar)
        
        // Layout constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            timeLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            progressBar.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            progressBar.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    @objc func eggTapped(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            switch tappedView.tag {
            case 1:
                startTimer(duration: eggTimes["Soft"]!)
            case 2:
                startTimer(duration: eggTimes["Medium"]!)
            case 3:
                startTimer(duration: eggTimes["Hard"]!)
            default:
                break
            }
        }
    }
    
    func startTimer(duration: Int) {
        timer?.invalidate()
        totalTime = duration
        secondsPassed = 0
        progressBar.progress = 0.0
        updateTimeLabel()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            updateTimeLabel()
        } else {
            timer?.invalidate()
            timeLabel.text = "DONE!"
            playAlarm()
        }
    }
    
    func updateTimeLabel() {
        let minutes = (totalTime - secondsPassed) / 60
        let seconds = (totalTime - secondsPassed) % 60
        timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    func playAlarm() {
        if let soundURL = Bundle.main.url(forResource: "alarm", withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Error playing alarm sound: \(error)")
            }
        }
    }
}
