//
//  GameInfo.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/13/22.
//

import Foundation

// @EnvironmentObject

class GameInfo: ObservableObject {
    var points: Int
    
    let answerClues: [AnswerClue]
    
    var currentClue: String
    var currentWord: String
    var guessCorrect: Bool
    
    init () {
        points = 12
        guessCorrect = false
        let url = Bundle.main.url(forResource: "TEST", withExtension: ".json")!
        let data = try! Data(contentsOf: url)
        answerClues = try! JSONDecoder().decode([AnswerClue].self, from: data)
        currentClue = answerClues[0].cluelist[0]
        currentWord = answerClues[0].answer
    }
    //static let begin = Status (points: 12, guessCorrect: false, guess: "")
    
    func guessing(guess: String) {
        if guess == currentWord {
            points += 1
            guessCorrect = true
        }
    }
    
}


func pointCalc(correct: Bool, prevPoints: Int) -> Int {
    if correct{
        return (prevPoints + 1)
    }
    return prevPoints
}
