//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Philip Yu on 6/29/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct QuestionBank {
    
    // MARK: - Properties
    var questionBank = [
        Question(text: "A slug's blood is green.", correctAnswer: true),
        Question(text: "Approximately one quarter of human bones are in the feet.", correctAnswer: true),
        Question(text: "The total surface area of two human lungs is approximately 70 square metres.", correctAnswer: true),
        Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: true),
        Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: false),
        Question(text: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: true),
        Question(text: "You can lead a cow down stairs but not up stairs.", correctAnswer: false),
        Question(text: "Google was originally called 'Backrub'.", correctAnswer: true),
        Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", correctAnswer: true),
        Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: false),
        Question(text: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: false),
        Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: true)
    ]
    var questionNumber: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer(_ userSelection: Int) -> Bool {
        
        let correctAnswer = questionBank[questionNumber].answer
        let userAnswer = questionBank[userSelection].answer
        
        if correctAnswer == userAnswer {
            // User got the answer right
            score += 1
            return true
        } else {
            // User got the answer wrong
            return false
        }
        
    }
    
    func getQuestionText() -> String {
        
        var questionText: String = ""
        
        if questionNumber < questionBank.count {
            questionText = questionBank[questionNumber].questionText
        }
        
        return questionText
        
    }
    
    func getProgress() -> Float {
        
        let progress = Float(questionNumber) / Float(questionBank.count)
        return progress
        
    }
    
    mutating func nextQuestion() {
        
        if questionNumber < questionBank.count {
            questionNumber += 1
        }
        
    }
    
    mutating func startOver () {
        
        questionNumber = 0
        score = 0
        
    }
    
    func getScore() -> Int {
        
        return score
        
    }
    
}
