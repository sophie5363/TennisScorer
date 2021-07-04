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
    
    @IBOutlet weak var scoreSet6P1: UILabel!
    
    @IBOutlet weak var scoreSet6P2: UILabel!
    
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
    var wonSetP1: Int = 0
    var wonSetP2: Int = 0
    
    //MARK: - HELPERS
    
 
    
    
    @IBAction func player1ScoreButtonPressed(_ sender: UIButton) {
        CounterGameP1 += 1
        
        if (CounterGameP1 == 0) {
            currentScoreP1.text = "0"
        }
        if (CounterGameP1 == 1) {
            currentScoreP1.text = "15"
        }
        if (CounterGameP1 == 2) {
            currentScoreP1.text = "30"
        }
        if (CounterGameP1 == 3) {
            currentScoreP1.text = "40"
        }
        
        if (CounterGameP1 == 4) {
            CounterGameP1 = 0
            currentScoreP1.text = "0"
            currentScoreP2.text = "0"
            
            if counterSet1P1 != 6 && counterSet1P2 != 6 {
                counterSet1P1 += 1
                print("P1 \(counterSet1P1)")
                scoreSet1P1.text = String(counterSet1P1)
            }
            
            if (counterSet1P1 == 6 || counterSet1P2 == 6) && (counterSet2P1 != 6 && counterSet2P2 != 6) {
                counterSet2P1 += 1
                print("P1 \(counterSet2P1)")
                scoreSet2P1.text = String(counterSet2P1)
            }
            
            if (counterSet2P1 == 6 || counterSet2P2 == 6) && (counterSet3P1 != 6 && counterSet3P2 != 6) {
                counterSet3P1 += 1
                print("P1 \(counterSet3P1)")
                scoreSet3P1.text = String(counterSet3P1)
            }
            
            if (counterSet3P1 == 6 || counterSet3P2 == 6) && (counterSet4P1 != 6 && counterSet4P2 != 6) {
                counterSet4P1 += 1
                print("P1 \(counterSet4P1)")
                scoreSet4P1.text = String(counterSet4P1)
            }
            
            if (counterSet4P1 == 6 || counterSet4P2 == 6) && (counterSet5P1 != 6 && counterSet5P2 != 6) {
                counterSet5P1 += 1
                print("P1 \(counterSet5P1)")
                scoreSet5P1.text = String(counterSet5P1)
            }
            
            
        }
    }
    
    @IBAction func player2BtnPressed(_ sender: Any) {
        CounterGameP2 += 1
        
        if (CounterGameP2 == 0) {
            currentScoreP2.text = "0"
        }
        if (CounterGameP2 == 1) {
            currentScoreP2.text = "15"
        }
        if (CounterGameP2 == 2) {
            currentScoreP2.text = "30"
        }
        if (CounterGameP2 == 3) {
            currentScoreP2.text = "40"
        }
        
        if (CounterGameP2 == 4) {
            CounterGameP2 = 0
            currentScoreP1.text = "0"
            currentScoreP2.text = "0"
            
            if counterSet1P1 != 6 && counterSet1P2 != 6 {
                counterSet1P2 += 1
                print("P2 \(counterSet1P2)")
                scoreSet1P2.text = String(counterSet1P2)
            }
            
            if (counterSet1P1 == 6 || counterSet1P2 == 6) && (counterSet2P1 != 6 && counterSet2P2 != 6) {
                counterSet2P2 += 1
                print("P2 \(counterSet2P2)")
                scoreSet2P2.text = String(counterSet2P2)
            }
            
            if (counterSet2P1 == 6 || counterSet2P2 == 6) && (counterSet3P1 != 6 && counterSet3P2 != 6) {
                counterSet3P2 += 1
                print("P2 \(counterSet2P2)")
                scoreSet3P2.text = String(counterSet3P2)
            }
            
            if (counterSet3P1 == 6 || counterSet3P2 == 6) && (counterSet4P1 != 6 && counterSet4P2 != 6) {
                counterSet4P2 += 1
                print("P2 \(counterSet2P2)")
                scoreSet4P2.text = String(counterSet4P2)
            }
            
            if (counterSet4P1 == 6 || counterSet4P2 == 6) && (counterSet5P1 != 6 && counterSet5P2 != 6) {
                counterSet5P2 += 1
                print("P2 \(counterSet5P2)")
                scoreSet5P2.text = String(counterSet5P2)
            }
        
            
            
               
        }
        

    }
    
}
