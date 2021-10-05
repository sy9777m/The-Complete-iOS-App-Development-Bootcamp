//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var answerOneButton: UIButton!
    @IBOutlet var answerTwoButton: UIButton!
    @IBOutlet var answerThreeButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.updateUI()
        })
        
    }
    
    func updateUI() {
        let answers = quizBrain.getAnswers()
        answerOneButton.setTitle(answers[0], for: .normal)
        answerTwoButton.setTitle(answers[1], for: .normal)
        answerThreeButton.setTitle(answers[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        answerOneButton.backgroundColor = UIColor.clear
        answerTwoButton.backgroundColor = UIColor.clear
        answerThreeButton.backgroundColor = UIColor.clear
    }
    
    
    
}

