//
//  AnswerClue.swift
//  InfiniteWordLadder
//
//  Created by Erika Webb on 5/15/22.
//

import Foundation

struct AnswerClue: Decodable {
    let index: Int
    let answer: String
    let cluelist: [String]
    //static let example = AnswerClue(id: 1, answer: "tree", clue: ["pine", "oak", "binary..."])
}
