//
//  QuestionsBrain.swift
//  MegzMugz
//
//  Created by Rohan Mengle on 8/16/21.
//

import Foundation

struct QuestionsBrain {
    
    var score = 0
    var questionTracker = 0
    
    let questions = [
            Questions(q: "MegzMugz was born 12/06/2003", choice1: "True", choice2: "False", points: 1, truth: "False"),
            Questions(q: "MegzMugz's favorite pasta is penne", choice1: "True", choice2: "False", points: 2, truth: "False"),
            Questions(q: "MegzMugz has a green colored bike", choice1: "True", choice2: "False", points: 3, truth: "True"),
            Questions(q: "MegzMugz has a 13.3in MacBook Air", choice1: "True", choice2: "False", points: 3, truth: "False"),
            Questions(q: "MegzMugz has two black hoodies", choice1: "True", choice2: "False", points: 3, truth: "True"),
            Questions(q: "The End!!", choice1: "Play", choice2: "Again", points: 0, truth: "idek")]
    
    mutating func whenAnswerButtonPressed(userChoice: String) {
        let currentQuestion = questions[questionTracker]
        if userChoice == currentQuestion.truth {
            questionTracker += 1
            score += currentQuestion.points
        } else {
            questionTracker += 1
        }
    }
    

    mutating func restart() {
        if questionTracker == questions.count {
            score = 0
            questionTracker = 0
        }
    }
    
    func progress() -> Float {
        return Float(questionTracker+1) / Float(questions.count)
    }
}


