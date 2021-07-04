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
    
    
    //MARK: - HELPERS
    
    // TODO : gérer best of 3 et best of 5
    
    // Pour gagner, un joueur doit avoir gagné 2 sets
//    func whoWonBestOf3() {
//        if counterSet1P1 == 6 {
//            wonSetP1 += 1
//        }
//
//        if counterSet2P1 == 6 {
//            wonSetP1 += 1
//        }
//
//        if counterSet3P1 == 6 {
//            wonSetP1 += 1
//        }
//
//        if counterSet1P2 == 6 {
//            wonSetP2 += 1
//        }
//
//        if counterSet2P2 == 6 {
//            wonSetP2 += 1
//        }
//
//        if counterSet3P2 == 6 {
//            wonSetP2 += 1
//        }
//
//        if wonSetP1 == 2 {
//            // alert
//            let alert = UIAlertController(title: "Match terminé",
//                                          message: "Le vainqueur est le joueur 1",
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//            self.present(alert, animated: true)
//        }
//
//        if wonSetP2 == 2 {
//            // alert
//            let alert = UIAlertController(title: "Match terminé",
//                                          message: "Le vainqueur est le joueur 2",
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//            self.present(alert, animated: true)
//
//            btnPlayer1.isHidden = true
//            btnPlayer2.isHidden = true
//
//        }
//    }
    
    // Pour gagner un joueur doit avoir gagné 3 sets
    func whoWonBestOf5() {
        var player1ScoresArray = [scoreSet1P1.text, scoreSet2P1.text, scoreSet3P1.text, scoreSet4P1.text, scoreSet5P1.text]
        
        var player2ScoresArray = [scoreSet1P2.text, scoreSet2P2.text, scoreSet3P2.text, scoreSet4P2.text, scoreSet5P2.text]
        

        var nbSetWonP1 = 0
        player1ScoresArray.forEach {
            x in if x == "6" {
                nbSetWonP1 += 1
            }
        print("nb de sets gagnés par 1st player \(nbSetWonP1)")
        }
        
        var nbSetWonP2 = 0
        player2ScoresArray.forEach {
            x in if x == "6" {
                nbSetWonP2 += 1
            }
        print("nb de sets gagnés par 1st player \(nbSetWonP2)")
        }
    
//
//        if scoreSet1P1.text == "6" {
//            wonSetP1 += 1
//        }
//
//        if scoreSet2P1.text == "6" {
//            wonSetP1 += 1
//        }
//
//        if scoreSet3P1.text == "6" {
//            wonSetP1 += 1
//        }
//
//        if scoreSet4P1.text == "6" {
//            wonSetP1 += 1
//        }
//
//        if scoreSet5P1.text == "6" {
//            wonSetP1 += 1
//        }
//
//
//        if scoreSet1P1.text == "6" {
//            wonSetP2 += 1
//        }
//
//        if scoreSet2P1.text == "6" {
//            wonSetP2 += 1
//        }
//
//        if scoreSet3P1.text == "6" {
//            wonSetP2 += 1
//        }
//
//        if scoreSet4P1.text == "6" {
//            wonSetP2 += 1
//        }
//
//        if scoreSet5P1.text == "6" {
//            wonSetP2 += 1
//        }
        

        if nbSetWonP1 == 3 {
            // alert
            let alert = UIAlertController(title: "Match terminé",
                                          message: "Le vainqueur est le joueur 1",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            btnPlayer1.isHidden = true
            btnPlayer2.isHidden = true
        }
        
        if nbSetWonP2 == 3 {
            // alert
            let alert = UIAlertController(title: "Match terminé",
                                          message: "Le vainqueur est le joueur 2",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            btnPlayer1.isHidden = true
            btnPlayer2.isHidden = true
        }
  
    }
    
    //MARK: - IBACTIONS
    
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
                scoreSet1P1.text = String(counterSet1P1)
            }
            
            if (counterSet1P1 == 6 || counterSet1P2 == 6) && (counterSet2P1 != 6 && counterSet2P2 != 6) {
                counterSet2P1 += 1
                scoreSet2P1.text = String(counterSet2P1)
            }
            
            if (counterSet2P1 == 6 || counterSet2P2 == 6) && (counterSet3P1 != 6 && counterSet3P2 != 6) {
                counterSet3P1 += 1
                scoreSet3P1.text = String(counterSet3P1)
            }
            
            if (counterSet3P1 == 6 || counterSet3P2 == 6) && (counterSet4P1 != 6 && counterSet4P2 != 6) {
                counterSet4P1 += 1
                scoreSet4P1.text = String(counterSet4P1)
            }
            
            if (counterSet4P1 == 6 || counterSet4P2 == 6) && (counterSet5P1 != 6 && counterSet5P2 != 6) {
                counterSet5P1 += 1
                scoreSet5P1.text = String(counterSet5P1)
            }

            whoWonBestOf5()
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
                scoreSet1P2.text = String(counterSet1P2)
            }
            
            if (counterSet1P1 == 6 || counterSet1P2 == 6) && (counterSet2P1 != 6 && counterSet2P2 != 6) {
                counterSet2P2 += 1
                scoreSet2P2.text = String(counterSet2P2)
            }
            
            if (counterSet2P1 == 6 || counterSet2P2 == 6) && (counterSet3P1 != 6 && counterSet3P2 != 6) {
                counterSet3P2 += 1
                scoreSet3P2.text = String(counterSet3P2)
            }
            
            if (counterSet3P1 == 6 || counterSet3P2 == 6) && (counterSet4P1 != 6 && counterSet4P2 != 6) {
                counterSet4P2 += 1
                scoreSet4P2.text = String(counterSet4P2)
            }
            
            if (counterSet4P1 == 6 || counterSet4P2 == 6) && (counterSet5P1 != 6 && counterSet5P2 != 6) {
                counterSet5P2 += 1
                scoreSet5P2.text = String(counterSet5P2)
            }

            
            whoWonBestOf5()
            
        }
    }
}
