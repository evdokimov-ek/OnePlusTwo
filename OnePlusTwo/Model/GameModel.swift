//
//  GameModel.swift
//  OnePlusTwo
//
//  Created by 19336088 on 08.10.2021.
//

import Foundation

struct GameModel {
    
    var score = 0
    var question: [Int]
    var answers: [Int]
    var sign = [1: "+", 2: "-"]
    var lag = [1, -1, 10, -10, 2, -2]
    var currentSign: Int
    var rightAnswer: Int
    let defaults = UserDefaults.standard
    
    mutating func prepareQuestion() {
        question[0] = Int.random(in: 9...100)
        currentSign = Int.random(in: 1...2)
        if currentSign == 1 {
            question[1] = Int.random(in: 1...100-question[0])
            answers[0] = question[0] + question[1]
        } else {
            question[1] = Int.random(in: 1...question[0]-1)
            answers[0] = question[0] - question[1]
        }
        rightAnswer = answers[0]
        lag.shuffle()
        for i in (1...3){
            answers[i] = answers[0] + lag[i]
        }
        answers.shuffle()
    
    }
    
    func getScore() -> Int{
        return score
    }
    
    mutating func checkAnswer(answer: Int) -> Bool {
        var rightAnswer: Int
        if currentSign == 1 { //знак плюс
            rightAnswer = question[0] + question[1]
        } else { // знак минус
            rightAnswer = question[0] - question[1]
        }
        if answer == rightAnswer {
            score += 10
            return true
        } else {
            return false
        }
    }
    
    func saveHighScore() {
        
        let hs = defaults.integer(forKey: "highScore")
        var rightAnswers = defaults.integer(forKey: "rightAnswers")
        var wrongAnswers = defaults.integer(forKey: "wrongAnswers")
        if score > hs {
            defaults.set(score, forKey: "highScore")
        }
        wrongAnswers += 1
        rightAnswers += Int(score/10)
        defaults.set(wrongAnswers, forKey: "wrongAnswers")
        defaults.set(rightAnswers, forKey: "rightAnswers")
        defaults.synchronize()
    }
}
