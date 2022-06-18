//
//  AnswerClue.swift
//  InfiniteWordLadder
//
//  Created by Erika Webb on 5/15/22.
//

import Foundation

struct AnswerClue: Decodable{
    let answer: String
    let cluelist: [String]
    let difficulty: Int
    //static let example = AnswerClue(id: 1, answer: "tree", clue: ["pine", "oak", "binary..."])
    
}
