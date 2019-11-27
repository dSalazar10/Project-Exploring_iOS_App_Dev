//
//  ViewController.swift
//  Quiz
//
//  Created by Daniel Salazar on 11/24/19.
//  Copyright © 2019 Daniel Salazar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capitol of California",
        "What is cognac made from?"
    ]
    let answers: [String] = [
        "14",
        "Sacromento",
        "Grapes"
    ]
    var currentQuestionIndex : Int = 0
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    @IBAction func ShowAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
}

