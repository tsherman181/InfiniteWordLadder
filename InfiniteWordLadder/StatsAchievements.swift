//
//  StatsAchievements.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/5/22.
//

import Foundation


class SA: ObservableObject{
    
    var achievements: [Int]
    var highscore: Int
    var numInRow: Int
    var relevantWords: Set<Int>
    let defaults: UserDefaults
    let numAch: Int
    
    init (){
        numAch = 3
        defaults = UserDefaults.standard
        highscore = defaults.integer(forKey: "High Score")
        numInRow = defaults.integer(forKey: "Number In A Row")
        relevantWords = defaults.object(forKey: "Relevant Words") as? Set<Int> ?? Set<Int> ()
        achievements = defaults.object(forKey: "Achievements") as? [Int] ?? [Int] ()
        if (achievements.isEmpty){
            achievements = Array(repeating: 0, count: numAch)
        }
    }
    
    
    
    
}
