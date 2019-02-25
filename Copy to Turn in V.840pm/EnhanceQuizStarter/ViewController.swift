//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
        
    // MARK: - Outlets
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadGameStartSound()
        playGameStartSound()
        displayQuestion()
    }
    
    // MARK: - Helpers
    
    func nextRound() {
        newQuestionArray.remove(at: 0)
        newQuestionArray.shuffle()
        if newQuestionArray.count == 0 {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    func displayQuestion() {
        questionField.text = newQuestionArray[0]["Question"]
        option1Button.setTitle(newQuestionArray[0]["Option1"], for: .normal)
        option2Button.setTitle(newQuestionArray[0]["Option2"], for: .normal)
        option3Button.setTitle(newQuestionArray[0]["Option3"], for: .normal)
        option4Button.setTitle(newQuestionArray[0]["Option4"], for: .normal)
        
        playAgainButton.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        option1Button.isHidden = true
        option2Button.isHidden = true
        option3Button.isHidden = true
        option4Button.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        questionField.text = "Way to go!\nYou got \(correctQuestions.count) out of \(QuestionProvider().questions.count) correct!"
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        
        print(newQuestionArray[0])
        
            if (sender === option1Button && newQuestionArray[0]["Option1"] == newQuestionArray[0]["Answer"])
            || (sender === option2Button && newQuestionArray[0]["Option2"] == newQuestionArray[0]["Answer"])
            || (sender === option3Button && newQuestionArray[0]["Option3"] == newQuestionArray[0]["Answer"])
            || (sender === option4Button && newQuestionArray[0]["Option4"] == newQuestionArray[0]["Answer"])
        
                {
                    correctQuestions.append(newQuestionArray[0])
                    questionField.text = "Correct!"
                } else {
                      questionField.text = "Sorry, wrong answer!"
                }
        
                loadNextRound(delay: 2)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        option1Button.isHidden = false
        option2Button.isHidden = false
        option3Button.isHidden = false
        option4Button.isHidden = false
        
        correctQuestions.removeAll()
        restartGame()
        nextRound()
    }
}
