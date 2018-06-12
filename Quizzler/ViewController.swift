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
    }
    

    func nextQuestion() {
        if (questionIndex < allQuestions.list.count - 1) {
            questionIndex += 1
            print(questionIndex, allQuestions.list.count)
        } else {
//            questionIndex = 0;
            
        }
        
        updateUI()
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionIndex].answer
        
        if correctAnswer == pickedAnswer {
            print("good")
        } else {
            print("bad")
        }
        
        nextQuestion()
        
    }
    
    
    func startOver() {
       
    }
    

    
}
