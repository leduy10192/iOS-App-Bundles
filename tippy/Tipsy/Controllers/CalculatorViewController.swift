//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedTip : Float = 0.1
    var splitNumber : Int = 2
    var calculatedResult: Float?
    

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true

        let buttonTitle = sender.currentTitle!
        selectedTip = (Float(buttonTitle.dropLast())!) / 100
        
        

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(format: "%d",splitNumber)
    }
    @IBAction func calculatePressed(_ sender: Any) {
        let selectedTipValue = selectedTip
        let totalBill = Float(billTextField.text!) ?? 0.0
        let splitNumberValue = Float(splitNumber)
        
        calculatedResult = totalBill * (1 + selectedTipValue) / splitNumberValue
        
        self.performSegue(withIdentifier: "showResult", sender: self)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showResult" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.numberOfPeople = splitNumber
            resultVC.tipPercentage = selectedTip
            resultVC.calculatedResult = calculatedResult
            
        }
        
    }

    
}

