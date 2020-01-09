//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 100]
    var timer = Timer()
    var secondPassed = 0
    var totalTime = 0
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func update() {
        if secondPassed < totalTime {
            
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            
        }else{
            timer.invalidate()
            topLabel.text = "DONE"
            playSound()
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        timer.invalidate()
        let hardness = sender.currentTitle!
        
        secondPassed = 0
        progressBar.progress = 0.0
        topLabel.text = "Style: \(hardness)"
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
