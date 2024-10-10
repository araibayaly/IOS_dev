//
//  ViewController.swift
//  DiceApp
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var sumLabel: UILabel!

    let diceImageNames = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        rollDice()
    }

    @IBAction func rollButtonAction(_ sender: Any) {
        rollDice()
    }

    func rollDice() {
        //generate random number between 1 and 6
        let randomDiceIndex1 = Int.random(in: 1...6)
        let randomDiceIndex2 = Int.random(in: 1...6)

        let diceImage1 = UIImage(named: diceImageNames[randomDiceIndex1])
        let diceImage2 = UIImage(named: diceImageNames[randomDiceIndex2])

        diceImageView1.image = diceImage1
        diceImageView2.image = diceImage2

        let die1Value = randomDiceIndex1 + 1
        let die2Value = randomDiceIndex2 + 1
        let sum = die1Value + die2Value

        sumLabel.text = "Sum: \(sum)"
    }
}
