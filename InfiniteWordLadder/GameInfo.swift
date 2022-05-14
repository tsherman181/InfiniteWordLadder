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
    
    // var [ClueAnswer]
        //clue, answer
    
    
    var guessCorrect: Bool
    
    init () {
        points = 12
        guessCorrect = false
    }
    //static let begin = Status (points: 12, guessCorrect: false, guess: "")
    
    func guessing(guess: String) {
        if guess == "win" {
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
