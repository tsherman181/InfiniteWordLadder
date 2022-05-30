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
    let defaults: UserDefaults
    @Published var currPage: Page
    
    init () {
        defaults = UserDefaults.standard
        points = defaults.integer(forKey: "Points")
        let url = Bundle.main.url(forResource: "full", withExtension: ".json")!
        let data = try! Data(contentsOf: url)
        answerClues = try! JSONDecoder().decode([AnswerClue].self, from: data)
        currentClueIndex = 0
        currentACIndex = 0 //MARK: This line is for testing purposes only
        //currentACIndex = Int.random(in: 0..<answerClues.count)
        currentClue = defaults.string(forKey: "Current Clue") ?? answerClues[currentACIndex].cluelist[currentClueIndex]
        currentWord = defaults.string(forKey: "Current Word") ?? answerClues[currentACIndex].answer
        var count = 0
        for i in answerClues{
            ACDict[i.answer] = count
            count += 1
        }
        currPage = .menu
        lastWord = defaults.string(forKey: "Last Word") ?? ""
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
        defaults.set(currentClue, forKey: "Current Clue")
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
        defaults.set(currentClue, forKey: "Current Clue")
        //MARK: Note, perhaps get creative with 'currentClueIndex' assignment and try to prevent repeating hints/answers
        currentWord = answerClues[currentACIndex].answer
        defaults.set(currentWord, forKey: "Current Word")
        lastWord = guess
        defaults.set(lastWord, forKey: "Last Word")
    }
    
    func giveUp( _ guess: String, _ last: String){
        currPage = .giveup
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.change(guess, last)
            self.currPage = .IWL
        }
        self.incrementPoint(-1)
    } //MARK: Some issues still persist in regards to remembering negative points, I do not know why
    
    func incrementPoint( _ num: Int){
        points += num
        defaults.set(points, forKey: "Points")
    }//MARK: Function not only increments point, but also sets the key so devices remembers the number of points when the user exits the application
    
    //MARK: A function is needed to keep track of the various animations that need to be preformed when a screen is exited out of/entered
}
