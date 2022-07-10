//
//  GameInfo.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/13/22.
//

import Foundation

import AVFoundation
import UIKit

enum Page {
    case menu
    case IWL
    case correct
    case instructions
    case giveup
    case gameover
    case achievements
    case stats
    case settings
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
    var onOff: Bool
    var prevWords: [String]
    var saobj: SA
    var difficulty: Int
    var lettersShown: Int
    var diffDict: [String: Int] = [:]
    var fiveLetters: String
    var tenLetters: String
    var fifteenLetters: String
    @Published var backgroundColor: UIColor
    var backgroundColorNumber: Int
    @Published var font: String
    var ladderColor: UIColor
    var ladderColorNumber: Int
    
    init () {
        //we initialize our defaults
        defaults = UserDefaults.standard
        //we set our points
        points = defaults.integer(forKey: "Points")
        //we read the relevant JSON
        let url = Bundle.main.url(forResource: "noCycle", withExtension: ".json")!
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
            onOff = true
            defaults.set(true, forKey: "Music")
        }
        onOff = defaults.bool(forKey: "Music")
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
        if let musicURL = Bundle.main.url(forResource: "chill-abstract-intention-12099_11KGzeua", withExtension: "mp3"){
            if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL){
                music = audioPlayer
                music.numberOfLoops = -1
                if (onOff){music.play()}
                else {music.pause()}
                print("here")
            }
        }
        else{
            music = nil
        }
        //deal with previous words
        //backgroundColor = .systemBlue
        
        //MARK: Color and font
        backgroundColorNumber = defaults.integer(forKey: "Background Color")
        backgroundColor = .systemBlue
        //font = defaults.string(forKey: "Font") ?? "Comic Sans MS"
        font = "Comic Sans MS"
        
        ladderColorNumber = defaults.integer(forKey: "Ladder Color")
        ladderColor = .black
        
        prevWords = defaults.object(forKey: "Previous Words") as? [String] ?? [String]()
        saobj = SA()
        
        diffDict = defaults.object(forKey: "Hash Difficulty") as? [String : Int] ?? [String : Int]()
        
        if (diffDict.isEmpty){
            print("Diff dict is empty")
            difficulty = 63
            for i in answerClues{
                diffDict[i.answer] = i.difficulty
            }
            defaults.set(difficulty, forKey: "Difficulty")
            defaults.set(diffDict, forKey: "Hash Difficulty")
        }
        
        difficulty = defaults.integer(forKey: "Difficulty")
        print("starting difficulty: \(difficulty)")
        
        
        fiveLetters = defaults.string(forKey: "Five Letters") ?? ""
        tenLetters = defaults.string(forKey: "Ten Letters") ?? ""
        fifteenLetters = defaults.string(forKey: "Fifteen Letters") ?? ""
        lettersShown = defaults.integer(forKey: "Letters Shown")
        
        if(lettersShown == 0){
            lettersShown = 10
        }
        defaults.set(lettersShown, forKey: "Letters Shown")
        if (fiveLetters.isEmpty || tenLetters.isEmpty || fifteenLetters.isEmpty){
            changeRelevantLetters()
        }
        defaults.set(fiveLetters, forKey: "Five Letters")
        defaults.set(tenLetters, forKey: "Ten Letters")
        defaults.set(fifteenLetters, forKey: "Fifteen Letters")
        if (backgroundColorNumber == 0){
            backgroundColor = .systemBlue
        }
        else if (backgroundColorNumber == 1){
            backgroundColor = .systemRed
        }
        else if (backgroundColorNumber == 2){
            backgroundColor = .systemGreen
        }
        defaults.set(font, forKey: "Font")
        if (ladderColorNumber == 0){
            ladderColor = .white
        }
        else if (ladderColorNumber == 1){
            ladderColor = .black
        }
        else if (ladderColorNumber == 2){
            ladderColor = .systemGray
        }
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
            if (i != ""){
                print(i)
                print(String(diffDict[i]!))
            }
        }
    }
    
    
    func change(_ guess: String, _ last: String){
        var newWord = guess
        //let's deal with the previous words
        addToPrev(guess)
        //The above code should populate our previous words array correctly
        var count = 0
        var bestDiffWord = ""
        var bestDiff = 0
        var currentMetric = Double(difficulty)
        while (newWord == guess){
            var chars = Array(newWord)
            chars[Int.random(in: 0...3)] = Character(UnicodeScalar(Int.random(in: 65...90))!)
            let temp = String(chars) //temp is our new word
            var inPrev = false
            if (ACDict[temp] != nil){
                if (currentMetric > 5){
                    for i in prevWords{
                        if i == temp{
                            inPrev = true
                        }
                    }//checks if in prev
                }//if the current metric is below 5, we must use previous words
                
                if (!inPrev && diffDict[temp]! > bestDiff && temp != guess){
                    bestDiff = diffDict[temp]!
                    bestDiffWord = temp
                }//update our best word if we find something better
                
                if (Double(bestDiff) > currentMetric && bestDiffWord != ""){
                    newWord = bestDiffWord
                }
            }//anything inside of this if statement is a valid word
            currentMetric -= 0.0025
            count += 1
            
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
        changeRelevantLetters()
    }
    
    func giveUp( _ guess: String, _ last: String){
        //addToPrev(guess)
        saobj.inRow(false)
        currPage = .giveup
        if points > -10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.change(guess, last)
            self.currPage = .IWL
            }
            incrementPoint(-1)
        }
        else if points <= -10 {
            currPage = .giveup
            points = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.change(guess, last)
                self.currPage = .gameover
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.currPage = .menu
                }
            }
        }
    }
    
    func incrementPoint( _ num: Int){
        points += num
        defaults.set(points, forKey: "Points")
    }//MARK: Function not only increments point, but also sets the key so devices remembers the number of points when the user exits the application
    
    //MARK: A function is needed to keep track of the various animations that need to be preformed when a screen is exited out of/entered
    
    func changeRelevantLetters(){
        var L5Set = Set<Character>()
        for i in Array(currentWord){
            L5Set.insert(i)
        }
        for i in Array(lastWord){
            L5Set.insert(i)
        }
        while L5Set.count < 5{
            L5Set.insert(Character(UnicodeScalar(Int.random(in: 65...90))!))
        }
        var tempArr = Array(L5Set).sorted()
        fiveLetters = String(tempArr)
        defaults.set(fiveLetters, forKey: "Five Letters")
        
        while L5Set.count < 10{
            L5Set.insert(Character(UnicodeScalar(Int.random(in: 65...90))!))
        }
        tempArr = Array(L5Set).sorted()
        tenLetters = String(Array(tempArr))
        defaults.set(tenLetters, forKey: "Ten Letters")
        
        while L5Set.count < 15 {
            L5Set.insert(Character(UnicodeScalar(Int.random(in: 65...90))!))
        }
        tempArr = Array(L5Set).sorted()
        fifteenLetters = String(Array(tempArr))
        defaults.set(fifteenLetters, forKey: "Fifteen Letters")
        
    }//MARK: To be done AFTER the current word and previous word have been changed
    //MARK: Maybe make these strings alphabetical
    
    func changeDiff(_ num: Int){
        defaults.set(num, forKey: "Difficulty")
        difficulty = defaults.integer(forKey: "Difficulty")
    }
    
    func playMusic() {
        if let musicURL = Bundle.main.url(forResource: "chill-abstract-intention-12099_11KGzeua.mp3", withExtension: "mp3") {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
                music = audioPlayer
                music.numberOfLoops = -1
                music.play()
            }
        }
    }
 
}
