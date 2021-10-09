//
//  ViewController.swift
//  OnePlusTwo
//
//  Created by 19336088 on 07.10.2021.
//

import UIKit

class ActionViewController: UIViewController {
    
    var gameModel = GameModel(question: [1, 2], answers: [1, 2, 3, 4], currentSign: 1)

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtons(_ sender: UIButton) {
        
        let userAnswer = Int(sender.currentTitle ?? "0")!
        let userGotIrRight = gameModel.checkAnswer(answer: userAnswer)
        print(userGotIrRight)
        if userGotIrRight {
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
            
            gameModel.saveHighScore()
            Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            self.dismiss(animated: true, completion: nil)
            
        }
        Timer.scheduledTimer(timeInterval: 0.5, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        
        gameModel.prepareQuestion()
        firstButton.setTitle(String(gameModel.answers[0]), for: .normal)
        secondButton.setTitle(String(gameModel.answers[1]), for: .normal)
        thirdButton.setTitle(String(gameModel.answers[2]), for: .normal)
        fourthButton.setTitle(String(gameModel.answers[3]), for: .normal)
        firstNumberLabel.text = String(gameModel.question[0])
        secondNumberLabel.text = String(gameModel.question[1])
        signLabel.text = gameModel.sign[gameModel.currentSign]
        
        scoreLabel.text = "Очки: \(gameModel.getScore())"
        firstButton.backgroundColor = UIColor.systemBrown
        secondButton.backgroundColor = UIColor.systemBrown
        thirdButton.backgroundColor = UIColor.systemBrown
        fourthButton.backgroundColor = UIColor.systemBrown
    }
}

