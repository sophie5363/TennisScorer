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
    var wonSetP1: Int = 0
    var wonSetP2: Int = 0
    
    //MARK: - HELPERS
    
    func isSet1Finished() -> Bool {
        if scoreSet1P1.text == "6" || scoreSet1P2.text == "6" {
            return true
        }
        else {
            return false
        }
    }
    
    func isSet2Finished() -> Bool {
        if scoreSet2P1.text == "6" || scoreSet2P2.text == "6" {
            return true
        }
        else {
            return false
        }
    }
    
    func isSet3Finished() -> Bool {
        if scoreSet3P1.text == "6" || scoreSet3P2.text == "6" {
            return true
        }
        else {
            return false
        }
    }
    
    func isSet4Finished() -> Bool {
        if scoreSet4P1.text == "6" || scoreSet4P2.text == "6" {
            return true
        }
        else {
            return false
        }
    }
  
    func incrementSetScoreP1() {
        counterSetP1 = counterSetP1 + 1
    }
    
    func incrementSetScoreP2() {
        counterSetP2 = counterSetP2 + 1
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
            
            if counterSetP1 != 6 && counterSetP2 != 6 {
                incrementSetScoreP1()
                print("P1 \(counterSetP1)")
                scoreSet1P1.text = String(counterSetP1)
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
//        if (CounterGameP2 == 4) {
//            incrementSetScoreP2()
//            print("P2 \(counterSetP2)")
//            scoreSet1P2.text = String(counterSetP2)
//            CounterGameP2 = 0
//            currentScoreP2.text = "0"
//            currentScoreP1.text = "0"
//        }
        
        if (CounterGameP2 == 4) {
            CounterGameP2 = 0
            currentScoreP1.text = "0"
            currentScoreP2.text = "0"
            
            if counterSetP1 != 6 && counterSetP2 != 6 {
                incrementSetScoreP2()
                print("P2 \(counterSetP2)")
                scoreSet1P2.text = String(counterSetP2)
            }
               
        }
        

    }
    
}
