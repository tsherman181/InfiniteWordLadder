//
//  StatsAchievements.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/5/22.
//

import Foundation


class SA: ObservableObject{
    
    var achievements: [Int]
    let achievementNames = ["Score 10 Points", "Score 50 Points", "Score 100 Points", "5 in a Row", "10 in a Row", "20 in a Row", "Wine and Dine", "Life is Good", "Coin Flip", "Stats Addict", "Mr. Pictionary", "Picture Perfect", "Quarter of Everything", "Halfway There", "Done it All"]
    let achievementDesc = ["Score 10 points in IWL game", "Score 50 points in IWL game", "Score 100 points in IWL game", "Guess 5 words in a row without giving up", "Guess 10 words in a row without giving up", "Guess 20 words in a row without giving up", "Guess the words \"Wine\" and \"Dine\" correctly", "Guess the words \"Life\" and \"Good\" correctly", "Guess the words \"Coin\" and \"Flip\" correctly", "Check the statistics page over 50 times", "Guess 10 words using the \"Picto\" font", "Guess 5 words in a row using the \"Picto\" font", "Guess a quarter of all the words in the game correctly", "Guess half of all the words in the game correctly", "Guess all of the words in the game correctly"]
    var highscore: Int
    var numInRow: Int
    var maxInRow: Int
    var relevantWords: Set<String>
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
        relevantWords = defaults.object(forKey: "Relevant Words") as? Set<String> ?? Set<String> ()
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
            if (font == "Wingdings"){
                wingdingsRow += 1
            }
        }
        else{
            numInRow = 0
            wingdingsRow = 0
        }
        defaults.set(numInRow, forKey: "Number In A Row")
        maxInRow = max(numInRow, maxInRow)
        defaults.set(maxInRow, forKey: "Max In A Row")
    }
    
    
    func check_achievements(_ guess: String, _ currPoints: Int){
        
        highscore = max(currPoints, highscore)
        relevantWords.insert(guess)
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
        if maxInRow >= 10{
            achievements[4] = 1
        }
        if maxInRow >= 20{
            achievements[5] = 1
        }
        
        if (relevantWords.contains("WINE") && relevantWords.contains("DINE")){
            achievements[6] = 1
        }
        
        if (relevantWords.contains("LIFE") && relevantWords.contains("GOOD")){
            achievements[7] = 1
        }
        
        if (relevantWords.contains("COIN") && relevantWords.contains("FLIP")){
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
        
        print("number in a row \(numInRow)")
        print("max in row \(maxInRow)")
    }
    
    
    
    
}
