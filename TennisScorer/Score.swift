//
//  Score.swift
//  TennisScorer
//
//  Created by Sophie Jacquot  on 10/07/2021.
//

import Foundation

enum MatchType: Int {
    case bestOf3 = 2
    case bestOf5 = 3
}

enum TennisScorerError: Error {
    case unfinishedMatchError
    case finishedMatchError
}

enum GameScore: String, Equatable {
    case love = "00"
    case fifteen = "15"
    case thirty = "30"
    case forty = "40"
    case advantage = "AD"
}

struct Score: Equatable {
    static func == (lhs: Score, rhs: Score) -> Bool {
        return true
    }
    
    var sets: [(Int, Int)]
    var setsCounter: Int = 0
    var currentGame: (GameScore, GameScore)
}

protocol TestableTennisScorer {
    var score: Score {get set}
    var isOver: Bool {get}
    init(matchType: MatchType, tieBreakInLastSet: Bool)
    func updateWithPointsByPlayer(_ player: Int) throws
    func winner() throws -> Int
}
