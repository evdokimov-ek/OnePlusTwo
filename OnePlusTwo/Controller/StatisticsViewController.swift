//
//  StatisticsViewController.swift
//  OnePlusTwo
//
//  Created by 19336088 on 10.10.2021.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var rightAnswersLabel: UILabel!
    @IBOutlet weak var wrongAnswersLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        defaults.set(0, forKey: "highScore")
//        defaults.set(0, forKey: "wrongAnswers")
//        defaults.set(0, forKey: "rightAnswers")
        
        let hs = defaults.integer(forKey: "highScore")
        let rightAnswers = defaults.integer(forKey: "rightAnswers")
        let wrongAnswers = defaults.integer(forKey: "wrongAnswers")
        highScoreLabel.text = "Рекорд: \(hs)"
        rightAnswersLabel.text = "Правильных ответов: \(rightAnswers)"
        wrongAnswersLabel.text = "Неправильных ответов: \(wrongAnswers)"
    }
    
    
    
    
}
