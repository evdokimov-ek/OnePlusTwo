//
//  MainViewController.swift
//  OnePlusTwo
//
//  Created by 19336088 on 08.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var hiScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hs = defaults.integer(forKey: "highScore")
        hiScoreLabel.text = "Рекорд: \(hs)"
        
        
    }
    
}
