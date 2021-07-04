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
    var counterSetP1: Int = 0
    var counterSetP2: Int = 0
    var counterCurrentScoreP1: Int = 0
    var counterCurrentScoreP2: Int = 0
    
    //MARK: - HELPERS
    
//    func plusFifteenPointP1() {
//        counterSetP1 += 1
//
//        if (counterSetP1 == 1) {
//            displayForP1(score: 15);
//        }
//        if (counterSetP1 == 2) {
//            displayForP1(score: 30);
//        }
//        if (counterSetP1 == 3) {
//            displayForP1(score: 40);
//        }
//    }

    func incrementScoreSet() {
        
    }
    
    
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
        }
        
        if (CounterGameP1 == 4) && (CounterGameP2 < CounterGameP1) {
            scoreSet1P1.text = "1"
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
            scoreSet1P2.text = "1"
            CounterGameP2 = 0
            currentScoreP2.text = "0"
            currentScoreP1.text = "0"
        }
        
        if (CounterGameP2 == 4) && (CounterGameP1 < CounterGameP2) {
            scoreSet1P1.text = "1"
            
        }
    }
    
}
