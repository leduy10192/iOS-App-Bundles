//
//  SettingsViewController.swift
//  tippy
//
//  Created by Duy Le on 12/19/19.
//  Copyright © 2019 Duy Le. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingDefault: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     @IBAction func changeDefault(_ sender: Any) {
     }
     */
    @IBAction func changeDefault(_ sender: Any) {
        let vc = ViewController(nibName: "ViewController", bundle: nil)
        vc.tipControl.selectedSegmentIndex = 0
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
