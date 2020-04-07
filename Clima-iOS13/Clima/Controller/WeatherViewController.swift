//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    //SF symbol avail for iOS 13
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set the current delegate property to the current class
        //This say: the text field should report back to our view controller
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        //dismiss the keyboard
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true // allows the textField to return
    }
    
    //Validation when should the text field end editing
    //return true end editing, false not end
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else{
            textField.placeholder = "Type Something"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        //belows are called as soons as any textFields on the screen are done with editing
        // Use searchTextField.text to get the weather for that city
        if let city = searchTextField.text {
            // if searchTextField.text == null -> skip
            weatherManager.fetchWeather(cityName: city)
        }
        
        //clear the textField
        searchTextField.text = ""
    }
}

