//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var trivia : [[String : String]] = []
    let questionsPerRound = QuestionProvider().questions.count
    var correctQuestions : [[String : String]] = []
    
    var gameSound: SystemSoundID = 0
        
    
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
    
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func displayQuestion() {
        
        trivia = generateRandomQuestion()
        questionField.text = trivia[0]["Question"]
        option1Button.setTitle(trivia[0]["Option1"], for: .normal)
        option2Button.setTitle(trivia[0]["Option2"], for: .normal)
        option3Button.setTitle(trivia[0]["Option3"], for: .normal)
        option4Button.setTitle(trivia[0]["Option4"], for: .normal)
        
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
    
    func nextRound() {
        if newQuestionArray.count == 0 {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
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
        
            if (sender === option1Button && trivia[0]["Option1"] == trivia[0]["Answer"])
            || (sender === option2Button && trivia[0]["Option2"] == trivia[0]["Answer"])
            || (sender === option3Button && trivia[0]["Option3"] == trivia[0]["Answer"])
            || (sender === option4Button && trivia[0]["Option4"] == trivia[0]["Answer"])
        
                {
                    correctQuestions.append(trivia[0])
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

