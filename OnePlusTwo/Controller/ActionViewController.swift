//
//  ViewController.swift
//  OnePlusTwo
//
//  Created by 19336088 on 07.10.2021.
//

import UIKit

class ActionViewController: UIViewController {
    
    var gameModel = GameModel(question: [1, 2], answers: [1, 2, 3, 4], currentSign: 1, rightAnswer: 3)
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 31

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
        
        if userGotIrRight {
            sender.backgroundColor = UIColor.green
            Timer.scheduledTimer(timeInterval: 0.5, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else{
            timer.invalidate()
            secondsPassed = 0
            sender.backgroundColor = UIColor.red
            self.gameModel.saveHighScore()
            let alert = UIAlertController(title: "К сожалению ты ошибся!", message: "Правильный ответ \(gameModel.rightAnswer)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { action in

                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }

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
        timer.invalidate()
        secondsPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            timerLabel.text = String(totalTime - secondsPassed)
            
        } else {
            timer.invalidate()
            secondsPassed = 0
            let alert = UIAlertController(title: "Время вышло!", message: "Правильный ответ \(gameModel.rightAnswer)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { action in
                self.gameModel.saveHighScore()
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
}

