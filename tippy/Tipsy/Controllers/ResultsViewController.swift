//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Duy Le on 4/2/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var numberOfPeople: Int?
    var tipPercentage: Float?
    var calculatedResult: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", calculatedResult ?? 0.0)
        settingsLabel.text = "Split between \(numberOfPeople!) with \(tipPercentage!*100)% tip"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
