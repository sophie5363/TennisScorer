//
//  homeViewController.swift
//  TennisScorer
//
//  Created by Sophie Jacquot  on 01/07/2021.
//

import UIKit

class homeViewController: UIViewController {
    
    enum MatchType: Int {
        case bestOf3 = 2
        case bestOf5 = 3
    }
    
    var choiceMatchType: Int?

    @IBOutlet weak var tieBreakBtn: UISwitch!
    
    @IBOutlet weak var nbSetsGagnantsBtn: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func matchTypePressed(_ sender: UISegmentedControl) {
        if(nbSetsGagnantsBtn.selectedSegmentIndex == 0)
        {
            choiceMatchType = 2
            
        }
        else if(nbSetsGagnantsBtn.selectedSegmentIndex == 1)
        {
            choiceMatchType = 3
        }
        
    }
}

