//
//  GameViewController.swift
//  TennisScorer
//
//  Created by Sophie Jacquot  on 04/07/2021.
//

import UIKit

class GameViewController: UIViewController {
    
    
    //    MARK: - IBOUTLETS
    
    @IBOutlet weak var btnPlayer1: UIButton!
    
    @IBOutlet weak var btnPlayer2: UIButton!
    
    @IBOutlet weak var currentScoreP1: UILabel!
    
    @IBOutlet weak var currentScoreP2: UILabel!
    
    @IBOutlet weak var scoreSet1P1: UILabel!
    
    @IBOutlet weak var scoreSet1P2: UILabel!
    
    @IBOutlet weak var scoreSet2P1: UILabel!
    
    @IBOutlet weak var scoreSet2P2: UILabel!
    
    @IBOutlet weak var scoreSet3P1: UILabel!
    
    @IBOutlet weak var scoreSet3P2: UILabel!
    
    @IBOutlet weak var scoreSet4P1: UILabel!
    
    @IBOutlet weak var scoreSet4P2: UILabel!
    
    @IBOutlet weak var scoreSet5P1: UILabel!
    
    @IBOutlet weak var scoreSet5P2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - PROPERTIES
    
    var CounterGameP1: Int = 0
    var CounterGameP2: Int = 0
    var counterSet1P1: Int = 0
    var counterSet1P2: Int = 0
    var counterSet2P1: Int = 0
    var counterSet2P2: Int = 0
    var counterSet3P1: Int = 0
    var counterSet3P2: Int = 0
    var counterSet4P1: Int = 0
    var counterSet4P2: Int = 0
    var counterSet5P1: Int = 0
    var counterSet5P2: Int = 0
    var counterCurrentScoreP1: Int = 0
    var counterCurrentScoreP2: Int = 0
    
    var tennisScorer: TennisScorer?
    
    
    
    //MARK: - HELPERS
    
    var currentSet: Int = 0
    
    func updateLabels() {
        
        scoreSet1P1.text = String(sharedTennisScorer!.score.sets[0].0)
        
        scoreSet2P1.text = String(sharedTennisScorer!.score.sets[1].0)
        
        scoreSet3P1.text = String(sharedTennisScorer!.score.sets[2].0)
        
        scoreSet4P1.text = String(sharedTennisScorer!.score.sets[3].0)
        
        scoreSet5P1.text = String(sharedTennisScorer!.score.sets[4].0)
        
        
        scoreSet1P2.text = String(sharedTennisScorer!.score.sets[0].1)
        
        scoreSet2P2.text = String(sharedTennisScorer!.score.sets[1].1)
        
        scoreSet3P2.text = String(sharedTennisScorer!.score.sets[2].1)
        
        scoreSet4P2.text = String(sharedTennisScorer!.score.sets[3].1)
        
        scoreSet5P2.text = String(sharedTennisScorer!.score.sets[4].1)
        
        var player1ScoresArray = [scoreSet1P1.text!, scoreSet2P1.text!, scoreSet3P1.text!, scoreSet4P1.text!, scoreSet5P1.text!]
        
        var player2ScoresArray = [scoreSet1P2.text!, scoreSet2P2.text!, scoreSet3P2.text!, scoreSet4P2.text!, scoreSet5P2.text!]
        
        
        if sharedTennisScorer!.isOver == false {
            do {
                let result = try sharedTennisScorer!.winner()
                
                if result == 1 {
                    sharedTennisScorer!.isOver = true
                    
                    let alert = UIAlertController(title: "Match terminé",
                                                  message: "Le vainqueur est le joueur 1",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    
                    btnPlayer1.isHidden = true
                    btnPlayer2.isHidden = true
                }
                
                if result == 2 {
                    sharedTennisScorer!.isOver = true
                    
                    let alert = UIAlertController(title: "Match terminé",
                                                  message: "Le vainqueur est le joueur 2",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    
                    btnPlayer1.isHidden = true
                    btnPlayer2.isHidden = true
                }
            } catch  {
                
            }
            
        }
        
    }
    
    //MARK: - VALUES LABELS
    //    var player1ScoresArray = [scoreSet1P1.text, scoreSet2P1.text, scoreSet3P1.text, scoreSet4P1.text, scoreSet5P1.text]
    //
    //    var player2ScoresArray = [scoreSet1P2.text, scoreSet2P2.text, scoreSet3P2.text, scoreSet4P2.text, scoreSet5P2.text]
    
    //MARK: - IBACTIONS
    
    
    @IBAction func player1ScoreButtonPressed(_ sender: UIButton) {
        CounterGameP1 += 1
        
        if (CounterGameP1 == 0) {
            currentScoreP1.text = GameScore.love.rawValue
        }
        if (CounterGameP1 == 1) {
            currentScoreP1.text = GameScore.fifteen.rawValue
        }
        if (CounterGameP1 == 2) {
            currentScoreP1.text = GameScore.thirty.rawValue
        }
        if (CounterGameP1 == 3) {
            currentScoreP1.text = GameScore.forty.rawValue
        }
        
        if (CounterGameP1 == 4) {
            if CounterGameP2 == 4 {
                CounterGameP1 = 3
                CounterGameP2 = 3
                currentScoreP1.text = GameScore.forty.rawValue
                currentScoreP2.text = GameScore.forty.rawValue
            }
            else {
                if CounterGameP2 == 3 {
                    currentScoreP1.text = GameScore.advantage.rawValue
                }
                else {
                    CounterGameP1 = 0
                    CounterGameP2 = 0
                    currentScoreP1.text = GameScore.love.rawValue
                    currentScoreP2.text = GameScore.love.rawValue
                    
                    do {
                        try  sharedTennisScorer!.updateWithPointsByPlayer(1)
                        if sharedTennisScorer!.updateLabel == true {
                            updateLabels()
                        }
                    } catch  {
                        //
                    }
                }
            }
        }
        if (CounterGameP1 == 5) {
            CounterGameP1 = 0
            CounterGameP2 = 0
            currentScoreP1.text = GameScore.love.rawValue
            currentScoreP2.text = GameScore.love.rawValue
            
            do {
                try  sharedTennisScorer!.updateWithPointsByPlayer(1)
                if sharedTennisScorer!.updateLabel == true {
                    updateLabels()
                }
            } catch  {
                //
            }
        }
    }
    
    
    @IBAction func player2BtnPressed(_ sender: Any) {
        CounterGameP2 += 1
        
        if (CounterGameP2 == 0) {
            currentScoreP2.text = GameScore.love.rawValue
        }
        if (CounterGameP2 == 1) {
            currentScoreP2.text = GameScore.fifteen.rawValue
        }
        if (CounterGameP2 == 2) {
            currentScoreP2.text = GameScore.thirty.rawValue
        }
        if (CounterGameP2 == 3) {
            currentScoreP2.text = GameScore.forty.rawValue
        }
        
        if (CounterGameP2 == 4) {
            if CounterGameP1 == 4 {
                CounterGameP1 = 3
                CounterGameP2 = 3
                currentScoreP1.text = GameScore.forty.rawValue
                currentScoreP2.text = GameScore.forty.rawValue
            }
            else {
                if CounterGameP1 == 3 {
                    currentScoreP2.text = GameScore.advantage.rawValue
                }
                else {
                    CounterGameP2 = 0
                    CounterGameP1 = 0
                    currentScoreP2.text = GameScore.love.rawValue
                    currentScoreP1.text = GameScore.love.rawValue
                    
                    do {
                        try  sharedTennisScorer!.updateWithPointsByPlayer(2)
                        if sharedTennisScorer!.updateLabel == true {
                            updateLabels()
                        }
                    } catch  {
                        //
                    }
                }
            }
        }
        if (CounterGameP2 == 5) {
            CounterGameP2 = 0
            CounterGameP1 = 0
            currentScoreP2.text = GameScore.love.rawValue
            currentScoreP1.text = GameScore.love.rawValue
            
            do {
                try  sharedTennisScorer!.updateWithPointsByPlayer(2)
                if sharedTennisScorer!.updateLabel == true {
                    updateLabels()
                }
            } catch  {
                //
            }
        }
    }
    
}
