//
//  GameInfo.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/13/22.
//

import Foundation

// @EnvironmentObject

enum Page {
    case p1
    case p2
}


class GameInfo: ObservableObject {

    var points: Int
    let answerClues: [AnswerClue]
    var ACDict: [String: Int] = [:]
    var currentClue: String
    var currentWord: String
    var currentClueIndex: Int
    var currentACIndex: Int
    @Published var currPage: Page
    
    init () {
        points = 0
        let url = Bundle.main.url(forResource: "full", withExtension: ".json")!
        let data = try! Data(contentsOf: url)
        answerClues = try! JSONDecoder().decode([AnswerClue].self, from: data)
        currentClueIndex = 0
        currentACIndex = 0 //MARK: This line is for testing purposes only
        //currentACIndex = Int.random(in: 0..<answerClues.count)
        currentClue = answerClues[currentACIndex].cluelist[currentClueIndex]
        currentWord = answerClues[currentACIndex].answer
        var count = 0
        for i in answerClues{
            ACDict[i.answer] = count
            count += 1
        }
        currPage = .p1
    }
    //static let begin = Status (points: 12, guessCorrect: false, guess: "")
    
    func guessing(guess: String) {
        if guess == currentWord {
            points += 1
            currPage = .p2
            change(currentWord)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // Change `2.0` to the desired number of seconds.
                self.currPage = .p1
            }
        }
    }
    
    func hint(){
        currentClueIndex += 1
        currentClue = answerClues[currentACIndex].cluelist[currentClueIndex]
        if currentClueIndex == answerClues[currentACIndex].cluelist.count {
            currentClueIndex = 0;
        }
    }

    
    func change(_ guess: String){
        var newWord = guess
        while (newWord == guess){
            var chars = Array(newWord)
            chars[Int.random(in: 0...3)] = Character(UnicodeScalar(Int.random(in: 65...90))!)
            let temp = String(chars)
            if (ACDict[temp] != nil){
                newWord = temp
            }
        }
        currentACIndex = ACDict[newWord]!
        currentClueIndex = 0
        currentClue = answerClues[currentACIndex].cluelist[currentClueIndex]
        //MARK: Note, perhaps get creative with 'currentClueIndex' assignment and try to prevent repeating hints/answers
        currentWord = answerClues[currentACIndex].answer
    }
    
}
