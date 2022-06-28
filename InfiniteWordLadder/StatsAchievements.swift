//
//  StatsAchievements.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/5/22.
//

import Foundation


class SA: ObservableObject{
    
    var achievements: [Int]
    let achievementNames = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    var highscore: Int
    var numInRow: Int
    var maxInRow: Int
    var relevantWords: Set<String>
    let defaults: UserDefaults
    let numAch: Int
    
    init (){
        numAch = 3
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
        relevantWords = [""]
        if highscore >= 10{
            achievements[0] = 1
        }
        if highscore >= 50{
            achievements[1] = 1
        }
        if highscore >= 100{
            achievements[2] = 1
        }
        
        defaults.set(achievements, forKey: "Achievements")
        defaults.set(highscore, forKey: "High Score")
        //defaults.set(relevantWords, forKey: "Relevant Words")
    }
    
    
    
    
}
