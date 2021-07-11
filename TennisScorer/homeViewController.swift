//
//  homeViewController.swift
//  TennisScorer
//
//  Created by Sophie Jacquot  on 01/07/2021.
//

import UIKit

class homeViewController: UIViewController {


    @IBOutlet weak var tieBreakBtn: UISwitch!
    
    @IBOutlet weak var nbSetsGagnantsBtn: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func matchTypePressed(_ sender: UISegmentedControl) {
        if(nbSetsGagnantsBtn.selectedSegmentIndex == 0)
        {
            sharedTennisScorer = TennisScorer(matchType: MatchType.bestOf3, tieBreakInLastSet: tieBreakBtn.isOn)
            
        }
        else if(nbSetsGagnantsBtn.selectedSegmentIndex == 1)
        {
            sharedTennisScorer = TennisScorer(matchType: MatchType.bestOf5, tieBreakInLastSet: tieBreakBtn.isOn)
        }
        
    }
}

