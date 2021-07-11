//
//  TennisScorerTests.swift
//  TennisScorerTests
//
//  Created by Sophie Jacquot  on 01/07/2021.
//

import XCTest
@testable import TennisScorer

class TennisScorerTests: XCTestCase {
    
    var scorer : TennisScorer!
    
    func setup(){
        scorer = TennisScorer(matchType: MatchType.bestOf3, tieBreakInLastSet: true)
    }

        func testSameScoreInSetsUsingGame() {
            var score1 = Score(sets: [(0,0)], currentGame: (.love, .love))
            var score2 = Score(sets: [(0,0)], currentGame: (.love, .love))
            XCTAssertEqual(score1, score2)

            let score3 = Score(sets: [(0,0)], currentGame: (.fifteen, .love))
            XCTAssertEqual(score1, score3)
            
            score1 = Score(sets: [(4,6), (6,0)], currentGame: (.fifteen, .fifteen))
            score2 = Score(sets: [(4,6), (6,0)], currentGame: (.fifteen, .fifteen))
            XCTAssertEqual(score1, score2)
            
            score1 = Score(sets: [(4,6), (6,0)], currentGame: (.fifteen, .forty))
            score2 = Score(sets: [(3,6), (6,0)], currentGame: (.fifteen, .love))
            XCTAssertEqual(score1, score2)
        }
    
    func test_initialScore() {
        XCTAssertNotEqual(scorer?.score, Score(sets: [(0,0)], currentGame: (.love, .love)))
    }

    func test_error_match_is_not_over(){
        XCTAssertNoThrow(try scorer?.winner())
    }
    

    
    
    override func tearDown() {
        scorer = nil
        super.tearDown()
    }
    
    

//    func XCTAssert(() -> Bool, () -> String, file: StaticString, line: UInt)
    
//    func XCTAssertFalse(() -> Bool, () -> String, file: StaticString, line: UInt)
//
//    func XCTAssertNil(() -> Any?, () -> String, file: StaticString, line: UInt)
//
//    func XCTAssertNotNil(() -> Any?, () -> String, file: StaticString, line: UInt)
//
//    func XCTAssertEqual<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)
//
//    func XCTAssertNotEqual<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)
//
//    func XCTAssertGreaterThan<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)
//
//    func XCTAssertLessThanOrEqual<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)
//
//    func XCTAssertGreaterThanOrEqual<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)
//
//    func XCTAssertLessThan<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)
//
//    func XCTAssertNoThrow<T>(() -> T, () -> String, file: StaticString, line: UInt)
}
