//
//  GameInfo.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/13/22.
//

import Foundation

enum Page {
    case menu
    case IWL
    case correct
    case instructions
    case giveup
    case achievements
    case stats
}


class GameInfo: ObservableObject {

    var points: Int
    let answerClues: [AnswerClue]
    var ACDict: [String: Int] = [:]
    var currentClue: String
    var currentWord: String
    var currentClueIndex: Int
    var currentACIndex: Int
    var lastWord: String
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
        currPage = .menu
        lastWord = ""
    }
    
    func insertSpaces(_ guess: String) -> String {
        let str = Array(guess)
        return str.map { "\($0)" }.joined(separator: "\n")
    }
    
    
    func guessing(guess: String) {
        if guess == currentWord {
            currPage = .correct
            change(currentWord, lastWord)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // Change `2.0` to the desired number of seconds.
                self.currPage = .IWL
            }
            self.incrementPoint(1)
        }
    }
    
    func hint(){
        currentClueIndex += 1
        if currentClueIndex == answerClues[currentACIndex].cluelist.count {
            currentClueIndex = 0;
        }
        currentClue = answerClues[currentACIndex].cluelist[currentClueIndex]
    }

    
    func change(_ guess: String, _ last: String){
        var newWord = guess
        while (newWord == guess){
            var chars = Array(newWord)
            chars[Int.random(in: 0...3)] = Character(UnicodeScalar(Int.random(in: 65...90))!)
            let temp = String(chars)
            if (ACDict[temp] != nil){
                if (last != temp){
                    newWord = temp
                }//MARK: Need to create set of past few clues to make sure no repeats, and then come up with solution for case where our only options are repeats or to break the cycle
            }
        }
        currentACIndex = ACDict[newWord]!
        currentClueIndex = 0
        currentClue = answerClues[currentACIndex].cluelist[currentClueIndex]
        //MARK: Note, perhaps get creative with 'currentClueIndex' assignment and try to prevent repeating hints/answers
        currentWord = answerClues[currentACIndex].answer
        lastWord = guess
    }
    
    func giveUp( _ guess: String, _ last: String){
        currPage = .giveup
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.change(guess, last)
            self.currPage = .IWL
        }
        self.incrementPoint(-1)
    }
    
    func incrementPoint( _ num: Int){
        points += num
    }
}
