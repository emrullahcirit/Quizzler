//
//  ViewController.swift
//  Quizzler
//
//  Created by Muhammed Emrullah Cirit on 14.12.2021.
//

import UIKit
// asdfasd
class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var thirdButton: UIButton!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
//lslslsls
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        var config = UIButton.Configuration.filled()
        config.titleTextAttributesTransformer =
            UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.preferredFont(forTextStyle: .headline)
                return outgoing
        }
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        

    }

    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        trueButton.setTitle(quizBrain.getAnswerText()[0], for: .normal)
        falseButton.setTitle(quizBrain.getAnswerText()[1], for: .normal)
        thirdButton.setTitle(quizBrain.getAnswerText()[2], for: .normal)
    }
    
    
}

