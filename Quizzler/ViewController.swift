//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionIndex: Int = 0
    var score: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionIndex = 0
        
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
        let question = allQuestions.list[questionIndex]
        questionLabel.text = question.questionText
        progressLabel.text = "\(questionIndex + 1)/\(allQuestions.list.count)"
        scoreLabel.text = "Score: \(score)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionIndex + 1)
    }
    

    func nextQuestion() {
        if (questionIndex < allQuestions.list.count - 1) {
            questionIndex += 1
            print(questionIndex, allQuestions.list.count)
        } else {

            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions with a score of \(score), do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
        updateUI()
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionIndex].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("correct!")
            score = score + 1
        } else {
            ProgressHUD.showError("wrong!")
        }
        
        nextQuestion()
        
    }
    
    
    func startOver() {
        questionIndex = 0
        score = 0
        updateUI()
    }
    

    
}
