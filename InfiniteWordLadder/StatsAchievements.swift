//
//  StatsAchievements.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/5/22.
//

import Foundation


class SA: ObservableObject{
    
    var achievements: [Int]
    let achievementNames = ["Score 10 Points", "Score 50 Points", "Score 100 Points", "5 in a Row", "20 in a Row", "50 in a Row", "Wine and Dine", "Life is Good", "Coin Flip", "Stats Addict", "Mr. Pictionary", "Picture Perfect", "Quarter of Everything", "Halfway There", "Done it All"]
    let achievementDesc = ["Score 10 points in IWL game", "Score 50 points in IWL game", "Score 100 points in IWL game", "Guess 5 words in a row without giving up", "Guess 20 words in a row without giving up", "Guess 50 words in a row without giving up", "Guess the words \"Wine\" and \"Dine\" correctly", "Guess the words \"Life\" and \"Good\" correctly", "Guess the words \"Coin\" and \"Flip\" correctly", "Check the statistics page over 50 times", "Guess 10 words using the \"Picto\" font (resets if you leave IWL page)", "Guess 5 words in a row using the \"Picto\" font (resets if you leave IWL page)", "Guess a quarter of all the words in the game correctly", "Guess half of all the words in the game correctly", "Guess all of the words in the game correctly"]
    var highscore: Int
    var numInRow: Int
    var maxInRow: Int
    var totalNum: Int
    var totalPercent: Double
    var numGiveup: Int
    var numHints: Int
    var gameHighscore: Int
    var gameNumInRow: Int
    var gameMaxInRow: Int
    var gameTotalNum: Int
    var gameTotalPercent: Double
    var gameNumGiveup: Int
    var gameNumHints: Int
    var relevantWords: [String:String]
    let defaults: UserDefaults
    let numAch: Int
    var statsCount: Int
    var wingdingsRow: Int
    var wingdingsTotal: Int
    
    init (){
        numAch = achievementNames.count
        defaults = UserDefaults.standard
        highscore = defaults.integer(forKey: "High Score")
        numInRow = defaults.integer(forKey: "Number In A Row")
        maxInRow = defaults.integer(forKey: "Max In A Row")
        totalNum = defaults.integer(forKey: "Total Words")
        totalPercent = defaults.double(forKey: "Total Percentage")
        numGiveup = defaults.integer(forKey: "Times Given Up")
        numHints = defaults.integer(forKey: "Hints Used")
        gameHighscore = defaults.integer(forKey: "Game High Score")
        gameNumInRow = defaults.integer(forKey: "Game Number In A Row")
        gameMaxInRow = defaults.integer(forKey: "Game Max In A Row")
        gameTotalNum = defaults.integer(forKey: "Game Total Words")
        gameTotalPercent = defaults.double(forKey: "Game Total Percentage")
        gameNumGiveup = defaults.integer(forKey: "Game Times Given Up")
        gameNumHints = defaults.integer(forKey: "Game Hints Used")
        relevantWords = defaults.object(forKey: "Relevant Words") as? [String:String] ?? [String:String]()
        achievements = defaults.object(forKey: "Achievements") as? [Int] ?? [Int] ()
        statsCount = defaults.integer(forKey: "Stats Count")
        wingdingsRow = defaults.integer(forKey: "Wingdings Row")
        wingdingsTotal = defaults.integer(forKey: "Wingdings Total")
        if (achievements.isEmpty){
            achievements = Array(repeating: 0, count: numAch)
        }
    }
    
    func inRow(_ boolean: Bool, _ font: String){
        if (boolean){
            numInRow += 1
            gameNumInRow += 1
            if (font == "Wingdings"){
                wingdingsRow += 1
            }
        }
        else{
            numInRow = 0
            gameNumInRow = 0
            wingdingsRow = 0
        }
        defaults.set(numInRow, forKey: "Number In A Row")
        defaults.set(gameNumInRow, forKey: "Game Number In A Row")
        maxInRow = max(numInRow, maxInRow)
        gameMaxInRow = max(gameNumInRow, gameMaxInRow)
        defaults.set(maxInRow, forKey: "Max In A Row")
        defaults.set(gameMaxInRow, forKey: "Game Max In A Row")
    }
    
    func numWords(){
        totalNum += 1
        gameTotalNum += 1
        totalPercent = (((Double(totalNum)/5384) * 100) * 1000).rounded(.toNearestOrEven) / 1000
        gameTotalPercent = (((Double(gameTotalNum)/5384) * 100) * 1000).rounded(.toNearestOrEven) / 1000
        defaults.set(totalNum, forKey: "Total Words")
        defaults.set(gameTotalNum, forKey: "Game Total Words")
        defaults.set(totalPercent, forKey: "Total Percentage")
        defaults.set(gameTotalPercent, forKey: "Game Total Percentage")
    }
    
    func giveUp(){
        numGiveup += 1
        gameNumGiveup += 1
        defaults.set(numGiveup, forKey: "Times Given Up")
        defaults.set(gameNumGiveup, forKey: "Game Times Given Up")
    }
    
    func hints(){
        numHints += 1
        gameNumHints += 1
        defaults.set(numHints, forKey: "Hints Used")
        defaults.set(gameNumHints, forKey: "Game Hints Used")
    }
    
    func setToZero(){
        gameHighscore = 0
        gameNumInRow = 0
        gameMaxInRow = 0
        gameTotalNum = 0
        gameTotalPercent = 0
        gameNumGiveup = 0
        gameNumHints = 0
    }
    
    
    func check_achievements(_ guess: String, _ currPoints: Int){
        
        highscore = max(currPoints, highscore)
        gameHighscore = max(currPoints, gameHighscore)
        //print(guess)
        //print(Array(guess))
        //print(String(Array(guess)))
        relevantWords[guess] = ""
        //print(relevantWords)
        if highscore >= 10{
            achievements[0] = 1
        }
        if highscore >= 50{
            achievements[1] = 1
        }
        if highscore >= 100{
            achievements[2] = 1
        }
        if maxInRow >= 5{
            achievements[3] = 1
        }
        if maxInRow >= 20{
            achievements[4] = 1
        }
        if maxInRow >= 50{
            achievements[5] = 1
        }
        
        if (relevantWords["WINE"] != nil && relevantWords["DINE"] != nil){
            achievements[6] = 1
        }
        
        if (relevantWords["LIFE"] != nil && relevantWords["GOOD"] != nil){
            achievements[7] = 1
        }
        
        if (relevantWords["COIN"] != nil && relevantWords["FLIP"] != nil){
            achievements[8] = 1
        }
        
        if (statsCount > 50){
            achievements[9] = 1
        }
        
        if (wingdingsTotal >= 10){
            achievements[10] = 1
        }
        
        if (wingdingsRow >= 5){
            achievements[11] = 1
        }
        
        if (0.25 <= Double(relevantWords.count)/5384.0){
            achievements[12] = 1
        }
        
        if (0.5 <= Double(relevantWords.count)/5384.0){
            achievements[13] = 1
        }
        
        if (1.0 <= Double(relevantWords.count)/5384.0){
            achievements[14] = 1
        }
        
        defaults.set(achievements, forKey: "Achievements")
        defaults.set(highscore, forKey: "High Score")
        defaults.set(relevantWords, forKey: "Relevant Words")
        
        //MARK: This code still needs work. We need to craft interesting acheivements and have them update as we go. This would be a good project to complete sometime.
        
        //print("number in a row \(numInRow)")
        //print("max in row \(maxInRow)")
    }
    
    
    
    
}
