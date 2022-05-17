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
    
    var currentClueIndex: Int
    var currentACIndex: Int
    init () {
        points = 12
        guessCorrect = false
        let url = Bundle.main.url(forResource: "full", withExtension: ".json")!
        let data = try! Data(contentsOf: url)
        answerClues = try! JSONDecoder().decode([AnswerClue].self, from: data)
        currentClue = answerClues[0].cluelist[0]
        currentClueIndex = 0
        currentACIndex = 0
        currentWord = answerClues[0].answer
    }
    //static let begin = Status (points: 12, guessCorrect: false, guess: "")
    
    func guessing(guess: String) {
        if guess == currentWord {
            points += 1
            guessCorrect = true
        }
    }
    
    func hint(){
        currentClueIndex += 1
        currentClue = answerClues[currentACIndex].cluelist[currentClueIndex]
        //MARK: FIX INDEX OUT OF RANGE ISSUE
    }
    
}
