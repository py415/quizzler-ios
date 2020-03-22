//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!

    // Properties
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0

    override func viewDidLoad() {

        super.viewDidLoad()

        nextQuestion()

    }

    @IBAction func answerPressed(_ sender: AnyObject) {

        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        } else {
            print("ERROR! Selected answer is invalid or does not exist!")
        }

        checkAnswer()
        questionNumber += 1
        nextQuestion()

    }

    func updateUI() {

        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / \(allQuestions.list.count)"

        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)

    }

    func nextQuestion() {

        if questionNumber < allQuestions.list.count {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        } else {
            print("End of Quiz!")
            let alert = UIAlertController(title: "Awesome!", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (_) in
                self.startOver()
            }

            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }

    }

    func checkAnswer() {

        let correctAnswer = allQuestions.list[questionNumber].answer

        if correctAnswer == pickedAnswer {
            print("Question #\(questionNumber). Correct!")
            ProgressHUD.showSuccess("Correct")
            score += 1
        } else {
            print("Question #\(questionNumber). Wrong!")
            ProgressHUD.showError("Wrong")
        }

    }

    func startOver() {

        questionNumber = 0
        score = 0
        nextQuestion()

    }

}
