//
//  TennisScorer.swift
//  TennisScorer
//
//  Created by Sophie Jacquot  on 11/07/2021.
//

import Foundation

var sharedTennisScorer : TennisScorer?

class TennisScorer : TestableTennisScorer {
    
    //            let alert = UIAlertController(title: "Match terminé",
    //                                          message: "Le vainqueur est le joueur 1",
    //                                          preferredStyle: .alert)
    //            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    //            self.present(alert, animated: true)
    //
    //            btnPlayer1.isHidden = true
    //            btnPlayer2.isHidden = true
    
    
    
    
    //MARK: - PROPRIETES

    var score: Score
    var isOver: Bool
    var tieBreak: Bool
    let matchType: MatchType
    var currentSet: Int
    
    var updateScoreMaybe: Bool = false
    
    var matchResult: [Bool] = [false, false, false, false, false]
    
    var updateLabel : Bool = false
    
    
    required init(matchType: MatchType, tieBreakInLastSet: Bool) {
        currentSet = 0
        self.matchType = matchType
        tieBreak = tieBreakInLastSet
        score = Score(sets: [(0,0),(0,0),(0,0),(0,0),(0,0)], currentGame: (GameScore.love, GameScore.love))
        isOver = false
    }
    

    
    func updateWithPointsByPlayer(_ player: Int) throws {
        var i : Int = 0
        
        for n in matchResult {
            if n == false {
                incrementPoint(numSet: i, playerNumber: player)
                updateLabel = true
                break
            }
            i += 1
        }
    }
    
   
    func winner() throws -> Int {
        if sharedTennisScorer!.updateScoreMaybe == true {
            sharedTennisScorer!.updateScoreMaybe = false
            if sharedTennisScorer!.matchType == MatchType.bestOf3  {
                return sharedTennisScorer!.whoWonBestOf3()
            }
            if sharedTennisScorer!.matchType == MatchType.bestOf5  {
                return sharedTennisScorer!.whoWonBestOf5()
            }
        }
        return -1
}
    
    
    func incrementPoint(numSet: Int, playerNumber: Int) {
        
        print("joueur 1 \(sharedTennisScorer!.score.sets[numSet].0)")
        print("joueur 2 \(sharedTennisScorer!.score.sets[numSet].1)")
        
        if playerNumber == 1 {
            sharedTennisScorer!.score.sets[numSet].0 += 1
            if(sharedTennisScorer!.score.sets[numSet].1 < 5 && sharedTennisScorer!.score.sets[numSet].0 == 6){
               
                matchResult[numSet] = true
                updateScoreMaybe = true
            }
            else{
                if(sharedTennisScorer!.score.sets[numSet].1 == 5 && sharedTennisScorer!.score.sets[numSet].0 == 7){
                    
                    matchResult[numSet] = true
                    updateScoreMaybe = true
                }
                else{
                    if(!sharedTennisScorer!.tieBreak){
                        if(sharedTennisScorer!.score.sets[numSet].1 == 6 && sharedTennisScorer!.score.sets[numSet].0 == 6){
                           
                            matchResult[numSet] = true
                            updateScoreMaybe = true
                        }
                    }
                    else{
                        if(sharedTennisScorer!.score.sets[numSet].1 == 6 && sharedTennisScorer!.score.sets[numSet].0 == 7){
                            
                            matchResult[numSet] = true
                            updateScoreMaybe = true
                        }
                    }
                }
            }
        }
        
        if playerNumber == 2 {
            sharedTennisScorer!.score.sets[numSet].1 += 1
            if(sharedTennisScorer!.score.sets[numSet].0 < 5 && sharedTennisScorer!.score.sets[numSet].1 == 6){
                
                matchResult[numSet] = true
                updateScoreMaybe = true
               
            }
            else{
                if(sharedTennisScorer!.score.sets[numSet].0 == 5 && sharedTennisScorer!.score.sets[numSet].1 == 7){
                    
                    matchResult[numSet] = true
                    updateScoreMaybe = true
                }
                else{
                    if(!sharedTennisScorer!.tieBreak){
                        if(sharedTennisScorer!.score.sets[numSet].0 == 6 && sharedTennisScorer!.score.sets[numSet].1 == 6){
                            
                            matchResult[numSet] = true
                            updateScoreMaybe = true
                        }
                    }
                    else{
                        if(sharedTennisScorer!.score.sets[numSet].0 == 6 && sharedTennisScorer!.score.sets[numSet].1 == 7){
                            
                            matchResult[numSet] = true
                            updateScoreMaybe = true
                        }
                    }
                }
            }
        }

    }
    
    // Pour gagner, un joueur doit avoir gagné 2 sets
    func whoWonBestOf3() -> Int{
        
        var nbSetWonP1 = 0
        var nbSetWonP2 = 0

        for i in 0..<score.sets.count {
            if score.sets[i].0 == 7 {
                nbSetWonP1 += 1
            }
            
            
            if score.sets[i].0 == 6 {
                if score.sets[i].1 == 6 {
                    //
                }
                else {
                    if score.sets[i].1 == 7 {
                        
                    }
                    else {
                        nbSetWonP1 += 1
                    }
                }
            }
            
            if score.sets[i].1 == 7 {
                nbSetWonP2 += 1
            }
            
            if score.sets[i].1 == 6 {
                if score.sets[i].0 == 6 {
                    //
                }
                else {
                    if score.sets[i].0 == 7 {
                       
                    }
                    else {
                        nbSetWonP2 += 1
                    }
                    
                }
            }
        }
    


        if nbSetWonP1 == 2 {
            // alert
            sharedTennisScorer!.isOver = true
            return 1

        }
        
        if nbSetWonP2 == 2 {
            
            sharedTennisScorer!.isOver = true
            return 2
        }
        
        return -1
        
}
    
    
    // Pour gagner un joueur doit avoir gagné 3 sets
    func whoWonBestOf5() -> Int {
       
        var nbSetWonP1 = 0
        var nbSetWonP2 = 0

        for i in 0..<score.sets.count {
            if score.sets[i].0 == 7 {
                nbSetWonP1 += 1
            }
            
            
            if score.sets[i].0 == 6 {
                if score.sets[i].1 == 6 {
                    //
                }
                else {
                    if score.sets[i].1 == 7 {
                        
                    }
                    else {
                        nbSetWonP1 += 1
                    }
                }
            }
            
            if score.sets[i].1 == 7 {
                nbSetWonP2 += 1
            }
            
            if score.sets[i].1 == 6 {
                if score.sets[i].0 == 6 {
                    //
                }
                else {
                    if score.sets[i].0 == 7 {
                       
                    }
                    else {
                        nbSetWonP2 += 1
                    }
                    
                }
            }
        }
    

        if nbSetWonP1 == 3 {
            // alert
            sharedTennisScorer!.isOver = true
            return 1
        }
        
        if nbSetWonP2 == 3 {
            // alert
            
            sharedTennisScorer!.isOver = true
            return 2
        }
        return -1
    }
    
}
