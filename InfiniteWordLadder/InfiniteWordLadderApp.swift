//
//  InfiniteWordLadderApp.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/11/22.
//

import SwiftUI

class Status {
    var points: Int
    var guessCorrect: Bool
    var guess: String
    
    init () {
        points = 12
        guessCorrect = false
        guess = ""
    }
    //static let begin = Status (points: 12, guessCorrect: false, guess: "")
    
    func guessing() {
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

@main
struct InfiniteWordLadderApp: App {
    var state = Status()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
