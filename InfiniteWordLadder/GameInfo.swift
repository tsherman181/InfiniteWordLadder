//
//  GameInfo.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/13/22.
//

import Foundation

import AVFoundation

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
    var music: AVAudioPlayer!
    var prevWords: [String]
    var saobj: SA
    
    
    init () {
        //we initialize our defaults
        defaults = UserDefaults.standard
        //we set our points
        points = defaults.integer(forKey: "Points")
        //we read the relevant JSON
        let url = Bundle.main.url(forResource: "full", withExtension: ".json")!
        let data = try! Data(contentsOf: url)
        answerClues = try! JSONDecoder().decode([AnswerClue].self, from: data)
        //we read in the correct clues, indecies, etc.
        currentClueIndex = defaults.integer(forKey: "Current Clue Index") //can be 0 on first download, nobody cares
        currentACIndex = defaults.integer(forKey: "Current AC Index")
        if (!defaults.bool(forKey: "First Time Download")){
            currentACIndex = Int.random(in: 0..<answerClues.count)
            print(currentACIndex)
            print(answerClues.count)
            defaults.set(true, forKey: "First Time Download")
        }
        currentClue = defaults.string(forKey: "Current Clue") ?? answerClues[currentACIndex].cluelist[currentClueIndex]
        currentWord = defaults.string(forKey: "Current Word") ?? answerClues[currentACIndex].answer
        
        //creates our hashing method to deal with quick lookup for the JSON
        ACDict = defaults.object(forKey: "Hash") as? [String : Int] ?? [String : Int]()
        if (ACDict.isEmpty){
            var count = 0
            for i in answerClues{
                ACDict[i.answer] = count
                count += 1
            }
            defaults.set(ACDict, forKey: "Hash")
        }
        //sets current page and last word to defaults
        currPage = .menu
        lastWord = defaults.string(forKey: "Last Word") ?? ""
        //deal with music
//        if let musicURL = Bundle.main.url(forResource: "PhantomFromSpace", withExtension: "mp3"){
//            if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL){
//                music = audioPlayer
//                music.numberOfLoops = -1
//                music.play()
//            }
//        }
//        else{
//            music = nil
//        }
        music = nil
        //deal with previous words
        prevWords = defaults.object(forKey: "Previous Words") as? [String] ?? [String]()
        saobj = SA()
        
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
            saobj.inRow(true)
            saobj.check_achievements(guess, points)
        }
    }
    
    func hint(){
        currentClueIndex += 1
        defaults.set(currentClue, forKey: "Current Clue Index")
        if currentClueIndex == answerClues[currentACIndex].cluelist.count {
            currentClueIndex = 0;
        }
        currentClue = answerClues[currentACIndex].cluelist[currentClueIndex]
        defaults.set(currentClue, forKey: "Current Clue")
    }

    
    func addToPrev(_ word: String){
        var count = min(9, prevWords.count)
        if (count < 10){
            let empty = ""
            prevWords.append(empty)
        }
        while (count > 0){
            prevWords[count] = prevWords[count-1]
            count -= 1
        }
        if (prevWords.isEmpty){
            prevWords.append(word)
        }
        prevWords[0] = word
        defaults.set(prevWords, forKey: "Previous Words")
        print("START")
        for i in prevWords{
            print(i)
        }
    }
    
    
    func change(_ guess: String, _ last: String){
        var newWord = guess
        //let's deal with the previous words
        addToPrev(guess)
        //The above code should populate our previous words array correctly
        var count = 0
        while (newWord == guess){
            var stop = false
            var chars = Array(newWord)
            chars[Int.random(in: 0...3)] = Character(UnicodeScalar(Int.random(in: 65...90))!)
            let temp = String(chars) //temp is our new word
            if (ACDict[temp] != nil){
                if (count < 10000){
                    for i in prevWords{
                        if (i == temp){
                            stop = true
                        }
                    }
                }
                if (!stop && temp != guess){
                    newWord = temp
                }
                count += 1
            }//anything inside of this if statement is a valid word
        }
        
        currentACIndex = ACDict[newWord]!
        defaults.set(currentACIndex, forKey: "Current AC Index")
        currentClueIndex = 0
        currentClue = answerClues[currentACIndex].cluelist[currentClueIndex]
        defaults.set(currentClue, forKey: "Current Clue")
        //MARK: Note, perhaps get creative with 'currentClueIndex' assignment and try to prevent repeating hints/answers
        currentWord = answerClues[currentACIndex].answer
        defaults.set(currentWord, forKey: "Current Word")
        lastWord = guess
        defaults.set(lastWord, forKey: "Last Word")
    }
    //MARK: THIS FUNCTION SHOULD KEEP OUR WORD LADDER INFINITE IF WE KNOW EACH WORD CAN BE REACH BY AT LEAST ONE OTHER WORD
    
    func giveUp( _ guess: String, _ last: String){
        //addToPrev(guess)
        saobj.inRow(false)
        currPage = .giveup
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.change(guess, last)
            self.currPage = .IWL
        }
        incrementPoint(-1)
    }
    
    func incrementPoint( _ num: Int){
        points += num
        defaults.set(points, forKey: "Points")
    }//MARK: Function not only increments point, but also sets the key so devices remembers the number of points when the user exits the application
    
    //MARK: A function is needed to keep track of the various animations that need to be preformed when a screen is exited out of/entered
    
    func playMusic() {
        if let musicURL = Bundle.main.url(forResource: "PhantomFromSpace", withExtension: "mp3") {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
                music = audioPlayer
                music.numberOfLoops = -1
                music.play()
            }
        }
    }
    
    
    
}
