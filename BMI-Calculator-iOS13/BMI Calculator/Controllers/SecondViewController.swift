//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Duy Le on 2/9/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        //set view backgroundColor to red
        view.backgroundColor = .red
        //create components programmatically
        let label = UILabel()
        label.text = bmiValue
        //indicate location and size of the label
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        //put the label onto the screen - the very basic component
        view.addSubview(label)
    }
}
