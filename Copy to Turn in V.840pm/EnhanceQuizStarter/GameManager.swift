//
//  Question Provider.swift
//  EnhanceQuizStarter
//
//  Created by User1 on 1/21/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation
import GameKit
import AudioToolbox

var gameSound: SystemSoundID = 0


func loadGameStartSound() {
    let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
    let soundUrl = URL(fileURLWithPath: path!)
    AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
}

func playGameStartSound() {
    AudioServicesPlaySystemSound(gameSound)
}

//Create Question Object//

struct QuestionProvider {
    
    var questions: [[String : String]] = [
        
        ["Question": "What is the Capital of Costa Rica?",
         "Option1": "Caracas",
         "Option2": "Managua",
         "Option3": "San Jose",
         "Option4": "Quito",
         "Answer": "San Jose"],
        
        ["Question": "What is the Capital of Panama?",
         "Option1": "Caracas",
         "Option2": "Managua",
         "Option3": "San Jose",
         "Option4": "Ciudad de Panama",
         "Answer": "Ciudad de Panama"],
        
        ["Question": "What is the Capital of Colombia?",
         "Option1": "Bogota",
         "Option2": "Managua",
         "Option3": "San Jose",
         "Option4": "Panama",
         "Answer": "Bogota"],
        
        ["Question": "What is the Capital of Uruguay?",
         "Option1": "Bogota",
         "Option2": "Montevideo",
         "Option3": "San Jose",
         "Option4": "Panama",
         "Answer": "Montevideo"],
        
        ["Question": "What is the Capital of Brazil?",
         "Option1": "Bogota",
         "Option2": "Montevideo",
         "Option3": "San Jose",
         "Option4": "Brasilia",
         "Answer": "Brasilia"],
        
        ["Question": "What is the Capital of Ecuador?",
         "Option1": "Quito",
         "Option2": "Montevideo",
         "Option3": "San Jose",
         "Option4": "Rio de Janeiro",
         "Answer": "Quito"],
        
        ["Question": "What is the Capital of Venezuela?",
         "Option1": "Quito",
         "Option2": "Montevideo",
         "Option3": "Caracas",
         "Option4": "Rio de Janeiro",
         "Answer": "Caracas"],
        
        ["Question": "What is the Capital of Nicaragua?",
         "Option1": "Quito",
         "Option2": "Montevideo",
         "Option3": "Managua",
         "Option4": "Rio de Janeiro",
         "Answer": "Managua"],
        
        ["Question": "What is the Capital of Honduras?",
         "Option1": "Tegucigualpa",
         "Option2": "Montevideo",
         "Option3": "Managua",
         "Option4": "Rio de Janeiro",
         "Answer": "Tegucigualpa"],
        
        ["Question": "What is the Capital of Peru?",
         "Option1": "Lima",
         "Option2": "Montevideo",
         "Option3": "Managua",
         "Option4": "Rio de Janeiro",
         "Answer": "Lima"],
        
        ["Question": "What is the Capital of Guatemala?",
         "Option1": "Lima",
         "Option2": "Montevideo",
         "Option3": "Ciudad de Guatemala",
         "Option4": "Rio de Janeiro",
         "Answer": "Ciudad de Guatemala"],
        
        ]
}
// MARK: - Properties
var correctQuestions : [[String : String]] = []
let questionsPerRound = QuestionProvider().questions.count

/* Create an instance of the Question Provider,
 and an empty array for the View Controller to work with */
var newQuestionArray = QuestionProvider().questions

/* This function resets the questions intance to play again*/

func restartGame() {
    newQuestionArray = QuestionProvider().questions
}

