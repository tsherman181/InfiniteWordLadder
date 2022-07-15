//
//  StatsAchievements.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/5/22.
//

import Foundation


class SA: ObservableObject{
    
    var achievements: [Int]
    let achievementNames = ["Score 10 Points", "Score 50 Points", "Score 100 Points", "5 in a Row", "10 in a Row", "20 in a Row", "Wine and Dine", "Life is Good", "Stats Addict", "Coin Flip", "Mr. Pictionary", "Picture Perfect", "Quarter of Everything", "Halfway There", "Done it all"]
    var highscore: Int
    var numInRow: Int
    var maxInRow: Int
    var relevantWords: Set<String>
    let defaults: UserDefaults
    let numAch: Int
    
    init (){
        numAch = achievementNames.count
        defaults = UserDefaults.standard
        highscore = defaults.integer(forKey: "High Score")
        numInRow = defaults.integer(forKey: "Number In A Row")
        maxInRow = defaults.integer(forKey: "Max In A Row")
        relevantWords = defaults.object(forKey: "Relevant Words") as? Set<String> ?? Set<String> ()
        achievements = defaults.object(forKey: "Achievements") as? [Int] ?? [Int] ()
        if (achievements.isEmpty){
            achievements = Array(repeating: 0, count: numAch)
        }
    }
    
    func inRow(_ boolean: Bool){
        if (boolean){
            numInRow += 1
        }
        else{
            numInRow = 0
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
        
        
        
        
        
        defaults.set(achievements, forKey: "Achievements")
        defaults.set(highscore, forKey: "High Score")
        //defaults.set(relevantWords, forKey: "Relevant Words")
        
        //MARK: This code still needs work. We need to craft interesting acheivements and have them update as we go. This would be a good project to complete sometime.
        
        print("number in a row \(numInRow)")
        print("max in row \(maxInRow)")
    }
    
    
    
    
}
