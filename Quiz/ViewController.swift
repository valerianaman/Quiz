//
//  ViewController.swift
//  Quiz
//
//  Created by Gonzalo Benítez Bueno on 18/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "What is 7+7",
        "What is the capital of Vermont",
        "What is cognac made from?"
        
    ]
    
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    var currentQuestionIndex: Int=0
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }

    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentQuestionLabel.alpha = 1
        nextQuestionLabel.alpha = 0
    }
    
    func animateLabelTransitions() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [],
            animations: {
            self.nextQuestionLabel.alpha = 1
            self.currentQuestionLabel.alpha = 0
        },
       completion: { _ in
            swap(&self.currentQuestionLabel,&self.nextQuestionLabel)
            
        }
        )
    }

}

