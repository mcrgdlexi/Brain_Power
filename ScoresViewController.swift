//
//  ScoresView.swift
//  Brain_Power
//
//  Created by Alexis Miller on 3/23/16.
//  Copyright © 2016 Alexis Miller. All rights reserved.
//

import Foundation
import UIKit

class ScoresViewController: UIViewController {
    
    // Variables to scores
    var OddOnePercentage:Int = Int()
    var FindPercentage:Int = Int()
    var AddPercentage:Int = Int()
    var SubtractPercentage:Int = Int()
    var MultiplyPercentage:Int = Int()
    var DividePercentage:Int = Int()
    var MemoryPercentage:Int = Int()
    var defaults = NSUserDefaults.standardUserDefaults()
    
    // Scores images
    @IBOutlet weak var OddOneScore: UIButton!
    @IBOutlet weak var FindScore: UIButton!
    @IBOutlet weak var AddScore: UIButton!
    @IBOutlet weak var SubtractScore: UIButton!
    @IBOutlet weak var MultiplyScore: UIButton!
    @IBOutlet weak var DivideScore: UIButton!
    @IBOutlet weak var MemoryScore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
        OddOneScore.setTitle(String(defaults.integerForKey("OddOnePercentage"))+"%", forState: UIControlState.Normal)
        FindScore.setTitle(String(defaults.integerForKey("FindPercentage"))+"%", forState: UIControlState.Normal)
        AddScore.setTitle(String(defaults.integerForKey("AddPercentage"))+"%", forState: UIControlState.Normal)
        SubtractScore.setTitle(String(defaults.integerForKey("SubtractPercentage"))+"%", forState: UIControlState.Normal)
        MultiplyScore.setTitle(String(defaults.integerForKey("MultiplyPercentage"))+"%", forState: UIControlState.Normal)
        DivideScore.setTitle(String(defaults.integerForKey("DividePercentage"))+"%", forState: UIControlState.Normal)
        MemoryScore.setTitle(String(defaults.integerForKey("MemoryPercentage"))+"%", forState: UIControlState.Normal)
    }
    @IBAction func ResetButton(sender: UIButton) {
        defaults.setInteger(0, forKey:"OddOnePercentage")
        defaults.setInteger(0, forKey:"FindPercentage")
        defaults.setInteger(0, forKey:"AddPercentage")
        defaults.setInteger(0, forKey:"SubtractPercentage")
        defaults.setInteger(0, forKey:"MultiplyPercentage")
        defaults.setInteger(0, forKey:"DividePercentage")
        defaults.setInteger(0, forKey:"MemoryPercentage")
        
        defaults.setInteger(0, forKey:"OddOneCorrect")
        defaults.setInteger(0, forKey:"FindCorrect")
        defaults.setInteger(0, forKey:"AddCorrect")
        defaults.setInteger(0, forKey:"SubtractCorrect")
        defaults.setInteger(0, forKey:"MultiplyCorrect")
        defaults.setInteger(0, forKey:"DivideCorrect")
        defaults.setInteger(0, forKey:"MemoryCorrect")
        
        defaults.setInteger(0, forKey:"OddOneTotal")
        defaults.setInteger(0, forKey:"FindTotal")
        defaults.setInteger(0, forKey:"AddTotal")
        defaults.setInteger(0, forKey:"SubtractTotal")
        defaults.setInteger(0, forKey:"MultiplyTotal")
        defaults.setInteger(0, forKey:"DivideTotal")
        defaults.setInteger(0, forKey:"MemoryTotal")
        viewDidLoad()
    }
}