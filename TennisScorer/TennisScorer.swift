//
//  TennisScorer.swift
//  TennisScorer
//
//  Created by Sophie Jacquot  on 11/07/2021.
//

import Foundation

var sharedTennisScorer : TestableTennisScorer?

class TennisScorer : TestableTennisScorer {
    
    //MARK: - PROPRIETES

    var score: Score
    var isOver: Bool
    var tieBreak: Bool
    let matchType: MatchType
    var currentSet: Int
    
    
    required init(matchType: MatchType, tieBreakInLastSet: Bool) {
        currentSet = 0
        self.matchType = matchType
        tieBreak = tieBreakInLastSet
        score = Score(sets: [(0,0),(0,0),(0,0),(0,0),(0,0)], currentGame: (GameScore.love, GameScore.love))
        isOver = false
    }
    
    private func updateCurrentSet(){
        currentSet += 1
        if(currentSet >= matchType.rawValue){
            isOver = true
        }
    }
    
    func getMatchType() -> Int {
        return matchType.rawValue
    }
    
    func updateWithPointsByPlayer(_ player: Int) throws {
        var isSet = false
        if(player == 0 && isOver == false){
            score.currentGame.0 = incrementPlayerPoint(score.currentGame.0, &score.currentGame.1, &isSet)
            if(isSet){
                score.sets[currentSet].0 += 1
                if(score.sets[currentSet].1 < 5 && score.sets[currentSet].0 == 6){
                    updateCurrentSet()
                }
                else{
                    if(score.sets[currentSet].1 == 5 && score.sets[currentSet].0 == 7){
                        updateCurrentSet()
                    }
                    else{
                        if(!tieBreak){
                            if(score.sets[currentSet].1 == 6 && score.sets[currentSet].0 == 6){
                                updateCurrentSet()
                            }
                        }
                        else{
                            if(score.sets[currentSet].1 == 6 && score.sets[currentSet].0 == 7){
                                updateCurrentSet()
                            }
                        }
                    }
                }
            }
        }else{
            if(player == 1 && isOver == false){
                score.currentGame.1 = incrementPlayerPoint(score.currentGame.1, &score.currentGame.0, &isSet)
                if(isSet){
                    score.sets[currentSet].1 += 1
                    if(score.sets[currentSet].0 < 5 && score.sets[currentSet].1 == 6){
                        updateCurrentSet()
                    }
                    else{
                        if(score.sets[currentSet].0 == 5 && score.sets[currentSet].1 == 7){
                            updateCurrentSet()
                        }
                        else{
                            if(!tieBreak){
                                if(score.sets[currentSet].0 == 6 && score.sets[currentSet].1 == 6){
                                    updateCurrentSet()
                                }
                            }
                            else{
                                if(score.sets[currentSet].0 == 6 && score.sets[currentSet].1 == 7){
                                    updateCurrentSet()
                                }
                            }
                        }
                    }
                }
            }else{
                print("Le joueur choisit n'est pas disponible")
            }
        }
    }
    
    private func incrementPlayerPoint(_ gameScorePlayer1 : GameScore, _ gameScorePlayer2 : inout GameScore, _ isSet : inout Bool)->GameScore{
         
         var newScore = gameScorePlayer1
         
         isSet = false
         
         if(gameScorePlayer1 == GameScore.love){
             newScore = GameScore.fifteen
         }
         if(gameScorePlayer1 == GameScore.fifteen){
             newScore = GameScore.thirty
         }
         if(gameScorePlayer1 == GameScore.thirty){
             newScore = GameScore.forty
         }
         if(gameScorePlayer1 == GameScore.forty){
             if ( gameScorePlayer2 == GameScore.advantage){
                 gameScorePlayer2 = GameScore.forty
             }
             else{
                 if(gameScorePlayer2 == GameScore.forty){
                     newScore = GameScore.advantage
                 }else{
                     newScore = GameScore.love
                     gameScorePlayer2 = GameScore.love
                     isSet = true
                 }
             }
         }
         if(gameScorePlayer1 == GameScore.advantage){
             newScore = GameScore.love
             gameScorePlayer2 = GameScore.love
             isSet = true
         }
         return newScore
     }
    
    
    func winner() throws -> Int {
        if(isOver){
            var cptVictoryPlayer1 = 0
            var cptVictoryPlayer2 = 0
            for set in score.sets{
                if(set.0>set.1){
                    cptVictoryPlayer1 += 1
                }else{
                    if(set.0<set.1){
                        cptVictoryPlayer2 += 1
                    }
                }
            }
            if(cptVictoryPlayer1 > cptVictoryPlayer2){
                return 0
            }
            if(cptVictoryPlayer1 < cptVictoryPlayer2){
                return 1
            }
            if(cptVictoryPlayer1 == cptVictoryPlayer2){
                return 2
            }
            
            return -1
            
        }else{
            return -1
        }
    }

}
