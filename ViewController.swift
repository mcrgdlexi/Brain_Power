//
//  ViewController.swift
//  Brain_Power
//
//  Created by Alexis Miller on 2/8/16.
//  Copyright © 2016 Alexis Miller. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    var ImageArray:[String] = ["Apple", "Banana", "Orange", "Basketball", "Football", "Volleyball", "Cat", "Dog", "Rabbit", "Shirt", "Jacket", "Pants", "Car", "Truck", "Bus", "Drum", "Guitar", "Piano", "Spoon", "Fork", "Knife", "Penny", "Dime", "Quarter", "Candy Corn", "Gummy Bears", "M&Ms", "Couch", "Recliner", "Table", "Markers", "Color Pencils", "Crayon", "Hammer", "Ax", "Drill", "Boots", "Heels", "Sneakers", "Vacuum", "Broom", "Mop", "Refrigerator", "Microwave", "Oven", "Egg", "Bacon", "Toast", "Bush", "Tree", "Plant", "Tulip", "Rose", "Lily", "Soda", "Tea", "Coffee", "Paper Clip", "Rubber Band", "Clothes Pin", "Dolphin", "Gold Fish", "Shark", "Heart", "Circle", "Square"]
    var answerSpot = 2
    
    
    // Variables to keep score
    var OddOneCorrect:Double = Double(0.0)
    var OddOneTotal:Double = Double(0.0)
    var FindCorrect:Double = Double(0.0)
    var FindTotal:Double = Double(0.0)
    var AddCorrect:Double = Double(0.0)
    var AddTotal:Double = Double(0.0)
    var SubtractCorrect:Double = Double(0.0)
    var SubtractTotal:Double = Double(0.0)
    var MultiplyCorrect:Double = Double(0.0)
    var MultiplyTotal:Double = Double(0.0)
    var DivideCorrect:Double = Double(0.0)
    var DivideTotal:Double = Double(0.0)
    var MemoryCorrect:Double = Double(0.0)
    var MemoryTotal:Double = Double(0.0)
    var defaults = NSUserDefaults.standardUserDefaults()
    
    // Odd One game images that will be changing
    @IBOutlet weak var OddOneImage1: UIImageView!
    @IBOutlet weak var OddOneImage2: UIImageView!
    @IBOutlet weak var OddOneImage3: UIImageView!
    @IBOutlet weak var OddOneImage4: UIImageView!
    
    // Odd One image buttons
    @IBOutlet weak var OddOneButton1: UIButton!
    @IBOutlet weak var OddOneButton2: UIButton!
    @IBOutlet weak var OddOneButton3: UIButton!
    @IBOutlet weak var OddOneButton4: UIButton!
    
    // Buttons for Odd One game
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var TryAgainButton: UIButton!
    @IBOutlet weak var CorrectLabel: UIButton!
    @IBOutlet weak var TryAgainLabel: UIButton!
    @IBOutlet weak var OddOneTitle: UILabel!
    
    // Find game images that will be changing
    @IBOutlet weak var FindImage1: UIImageView!
    @IBOutlet weak var FindImage2: UIImageView!
    @IBOutlet weak var FindImage3: UIImageView!
    @IBOutlet weak var FindImage4: UIImageView!
    
    // Find image buttons
    @IBOutlet weak var FindButton1: UIButton!
    @IBOutlet weak var FindButton2: UIButton!
    @IBOutlet weak var FindButton3: UIButton!
    @IBOutlet weak var FindButton4: UIButton!
    
    // Buttons for Find game
    @IBOutlet weak var NextButtonFind: UIButton!
    @IBOutlet weak var ImageNameFind: UIButton!
    @IBOutlet weak var TryAgainButtonFind: UIButton!
    @IBOutlet weak var CorrectLabelFind: UIButton!
    @IBOutlet weak var TryAgainLabelFind: UIButton!
    @IBOutlet weak var FindTitle: UILabel!
    
    // Memory game images that will be changing
    @IBOutlet weak var MemoryImage1: UIImageView!
    @IBOutlet weak var MemoryImage2: UIImageView!
    @IBOutlet weak var MemoryImage3: UIImageView!
    @IBOutlet weak var MemoryImage4: UIImageView!
    
    // Memory image buttons
    @IBOutlet weak var MemoryButton1: UIButton!
    @IBOutlet weak var MemoryButton2: UIButton!
    @IBOutlet weak var MemoryButton3: UIButton!
    @IBOutlet weak var MemoryButton4: UIButton!
    
    // Buttons for the Memory game
    @IBOutlet weak var ImageNameMemory: UIButton!
    @IBOutlet weak var NextButtonMemory: UIButton!
    @IBOutlet weak var TryAgainButtonMemory: UIButton!
    @IBOutlet weak var CorrectLabelMemory: UIButton!
    @IBOutlet weak var TryAgainLabelMemory: UIButton!
    @IBOutlet weak var MemoryTitle: UILabel!
    @IBOutlet weak var Error: UIButton!
    
    var topController: UIViewController = (UIViewController)()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
        navigationController?.setToolbarHidden(true, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Odd One game randomizing the pictures on click
    @IBAction func CorrectButton(sender: UIButton) {
        self.NextButtonOddOne(UIButton)
    }
    @IBAction func NextButtonOddOne(sender: AnyObject?) {
        self.OddOneTitle.adjustsFontSizeToFitWidth = true
        self.OddOneImage1.hidden = false
        self.OddOneImage2.hidden = false
        self.OddOneImage3.hidden = false
        self.OddOneImage4.hidden = false
        self.OddOneButton1.hidden = false
        self.OddOneButton2.hidden = false
        self.OddOneButton3.hidden = false
        self.OddOneButton4.hidden = false
        self.NextButton.hidden = true
        self.CorrectLabel.hidden = true
        
        var randomNumber:Int = Int(arc4random_uniform(66))
        let randomSet:Int = Int(arc4random_uniform(22)*3)
        answerSpot = Int(arc4random_uniform(4)+1)
        let firstCardString:String
        let secondCardString:String
        let thirdCardString:String
        let fourthCardString:String
        
        repeat{
            randomNumber = Int(arc4random_uniform(66))
        }while randomNumber == randomSet || randomNumber == randomSet+1 || randomNumber == randomSet+2
        
        if answerSpot==1 {
            firstCardString = self.ImageArray[randomNumber]
            secondCardString = self.ImageArray[randomSet]
            thirdCardString = self.ImageArray[randomSet+1]
            fourthCardString = self.ImageArray[randomSet+2]
        }
        else if answerSpot==2 {
            firstCardString = self.ImageArray[randomSet+2]
            secondCardString = self.ImageArray[randomNumber]
            thirdCardString = self.ImageArray[randomSet]
            fourthCardString = self.ImageArray[randomSet+1]
        }
        else if answerSpot==3 {
            firstCardString = self.ImageArray[randomSet+1]
            secondCardString = self.ImageArray[randomSet+2]
            thirdCardString = self.ImageArray[randomNumber]
            fourthCardString = self.ImageArray[randomSet]
        }
        else {
            firstCardString = self.ImageArray[randomSet]
            secondCardString = self.ImageArray[randomSet+1]
            thirdCardString = self.ImageArray[randomSet+2]
            fourthCardString = self.ImageArray[randomNumber]
        }
        
        self.OddOneImage1.image = UIImage(named: firstCardString)
        self.OddOneImage2.image = UIImage(named: secondCardString)
        self.OddOneImage3.image = UIImage(named: thirdCardString)
        self.OddOneImage4.image = UIImage(named: fourthCardString)
    }
    
    // Try again, show the pictures again
    @IBAction func AlmostButton(sender: UIButton) {
        self.TryAgainButtonOddOne(UIButton)
    }
    @IBAction func TryAgainButtonOddOne(sender: AnyObject?) {
        self.OddOneImage1.hidden = false
        self.OddOneImage2.hidden = false
        self.OddOneImage3.hidden = false
        self.OddOneImage4.hidden = false
        self.OddOneButton1.hidden = false
        self.OddOneButton2.hidden = false
        self.OddOneButton3.hidden = false
        self.OddOneButton4.hidden = false
        self.TryAgainLabel.hidden = true
        self.TryAgainButton.hidden = true
    }
    
    // Buttons for the Odd One game's pictures
    @IBAction func FirstButton(sender: UIButton) {
        self.OddOneImage1.hidden = true
        self.OddOneImage2.hidden = true
        self.OddOneImage3.hidden = true
        self.OddOneImage4.hidden = true
        self.OddOneButton1.hidden = true
        self.OddOneButton2.hidden = true
        self.OddOneButton3.hidden = true
        self.OddOneButton4.hidden = true
        defaults.setDouble(defaults.doubleForKey("OddOneTotal")+1.0, forKey:"OddOneTotal")
        if answerSpot == 1{
            defaults.setDouble(defaults.doubleForKey("OddOneCorrect")+1.0, forKey:"OddOneCorrect")
            self.CorrectLabel.hidden = false
            CorrectLabel.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButton.hidden = false
        }
        else{
            self.TryAgainLabel.hidden = false
            TryAgainLabel.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButton.hidden = false
        }
    }
    @IBAction func SecondButton(sender: UIButton) {
        self.OddOneImage1.hidden = true
        self.OddOneImage2.hidden = true
        self.OddOneImage3.hidden = true
        self.OddOneImage4.hidden = true
        self.OddOneButton1.hidden = true
        self.OddOneButton2.hidden = true
        self.OddOneButton3.hidden = true
        self.OddOneButton4.hidden = true
        defaults.setDouble(defaults.doubleForKey("OddOneTotal")+1.0, forKey:"OddOneTotal")
        if answerSpot == 2{
            defaults.setDouble(defaults.doubleForKey("OddOneCorrect")+1.0, forKey:"OddOneCorrect")
            self.CorrectLabel.hidden = false
            CorrectLabel.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButton.hidden = false
        }
        else{
            self.TryAgainLabel.hidden = false
            TryAgainLabel.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButton.hidden = false
        }
    }
    @IBAction func ThirdButton(sender: UIButton) {
        self.OddOneImage1.hidden = true
        self.OddOneImage2.hidden = true
        self.OddOneImage3.hidden = true
        self.OddOneImage4.hidden = true
        self.OddOneButton1.hidden = true
        self.OddOneButton2.hidden = true
        self.OddOneButton3.hidden = true
        self.OddOneButton4.hidden = true
        defaults.setDouble(defaults.doubleForKey("OddOneTotal")+1.0, forKey:"OddOneTotal")
        if answerSpot == 3{
            defaults.setDouble(defaults.doubleForKey("OddOneCorrect")+1.0, forKey:"OddOneCorrect")
            self.CorrectLabel.hidden = false
            CorrectLabel.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButton.hidden = false
        }
        else{
            self.TryAgainLabel.hidden = false
            TryAgainLabel.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButton.hidden = false
        }
    }
    @IBAction func FourthButton(sender: UIButton) {
        self.OddOneImage1.hidden = true
        self.OddOneImage2.hidden = true
        self.OddOneImage3.hidden = true
        self.OddOneImage4.hidden = true
        self.OddOneButton1.hidden = true
        self.OddOneButton2.hidden = true
        self.OddOneButton3.hidden = true
        self.OddOneButton4.hidden = true
        defaults.setDouble(defaults.doubleForKey("OddOneTotal")+1.0, forKey:"OddOneTotal")
        if answerSpot == 4{
            defaults.setDouble(defaults.doubleForKey("OddOneCorrect")+1.0, forKey:"OddOneCorrect")
            self.CorrectLabel.hidden = false
            CorrectLabel.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButton.hidden = false
        }
        else{
            self.TryAgainLabel.hidden = false
            TryAgainLabel.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButton.hidden = false
        }
    }

    // Find game randomizing the pictures on click
    @IBAction func CorrectbuttonFind(sender: UIButton) {
        self.NextButtonFindGame(UIButton)
    }
    @IBAction func NextButtonFindGame(sender: AnyObject?) {
        self.FindImage1.hidden = false
        self.FindImage2.hidden = false
        self.FindImage3.hidden = false
        self.FindImage4.hidden = false
        self.FindButton1.hidden = false
        self.FindButton2.hidden = false
        self.FindButton3.hidden = false
        self.FindButton4.hidden = false
        self.ImageNameFind.hidden = false
        self.NextButtonFind.hidden = true
        self.CorrectLabelFind.hidden = true
        
        let randomNumber1:Int = Int(arc4random_uniform(66))
        var randomNumber2:Int = Int(arc4random_uniform(66))
        var randomNumber3:Int = Int(arc4random_uniform(66))
        var randomNumber4:Int = Int(arc4random_uniform(66))
        answerSpot = Int(arc4random_uniform(4)+1)
        
        repeat{
            randomNumber2 = Int(arc4random_uniform(66))
        }while randomNumber1 == randomNumber2
        repeat{
            randomNumber3 = Int(arc4random_uniform(66))
        }while randomNumber1 == randomNumber3 || randomNumber2 == randomNumber3
        repeat{
            randomNumber4 = Int(arc4random_uniform(66))
        }while randomNumber1 == randomNumber4 || randomNumber2 == randomNumber4 || randomNumber3 == randomNumber4
        
        let firstCardString:String = String(self.ImageArray[randomNumber1])
        let secondCardString:String = String(self.ImageArray[randomNumber2])
        let thirdCardString:String = String(self.ImageArray[randomNumber3])
        let fourthCardString:String = String(self.ImageArray[randomNumber4])
        
        self.FindImage1.image = UIImage(named: firstCardString)
        self.FindImage2.image = UIImage(named: secondCardString)
        self.FindImage3.image = UIImage(named: thirdCardString)
        self.FindImage4.image = UIImage(named: fourthCardString)
        
        if answerSpot==1 {
            self.ImageNameFind.setTitle(" "+ImageArray[randomNumber1]+" ", forState: UIControlState.Normal)
        }
        else if answerSpot==2 {
            self.ImageNameFind.setTitle(" "+ImageArray[randomNumber2]+" ", forState: UIControlState.Normal)
        }
        else if answerSpot==3 {
            self.ImageNameFind.setTitle(" "+ImageArray[randomNumber3]+" ", forState: UIControlState.Normal)
        }
        else {
            self.ImageNameFind.setTitle(" "+ImageArray[randomNumber4]+" ", forState: UIControlState.Normal)
        }
    }
    
    // Try again, show the pictures again
    @IBAction func AlmostButtonFind(sender: UIButton) {
        self.TryAgainButtonFind(UIButton)
    }
    @IBAction func TryAgainButtonFind(sender: AnyObject?) {
        self.FindImage1.hidden = false
        self.FindImage2.hidden = false
        self.FindImage3.hidden = false
        self.FindImage4.hidden = false
        self.FindButton1.hidden = false
        self.FindButton2.hidden = false
        self.FindButton3.hidden = false
        self.FindButton4.hidden = false
        self.ImageNameFind.hidden = false
        self.TryAgainLabelFind.hidden = true
        self.TryAgainButtonFind.hidden = true
    }
    
    // Buttons for the Find game's pictures.
    @IBAction func FirstButtonFind(sender: UIButton) {
        self.FindImage1.hidden = true
        self.FindImage2.hidden = true
        self.FindImage3.hidden = true
        self.FindImage4.hidden = true
        self.FindButton1.hidden = true
        self.FindButton2.hidden = true
        self.FindButton3.hidden = true
        self.FindButton4.hidden = true
        self.ImageNameFind.hidden = true
        defaults.setDouble(defaults.doubleForKey("FindTotal")+1.0, forKey:"FindTotal")
        if answerSpot == 1{
            defaults.setDouble(defaults.doubleForKey("FindCorrect")+1.0, forKey:"FindCorrect")
            self.CorrectLabelFind.hidden = false
            CorrectLabelFind.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonFind.hidden = false
        }
        else{
            self.TryAgainLabelFind.hidden = false
            TryAgainLabelFind.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonFind.hidden = false
        }
    }
    @IBAction func SecondButtonFind(sender: UIButton) {
        self.FindImage1.hidden = true
        self.FindImage2.hidden = true
        self.FindImage3.hidden = true
        self.FindImage4.hidden = true
        self.FindButton1.hidden = true
        self.FindButton2.hidden = true
        self.FindButton3.hidden = true
        self.FindButton4.hidden = true
        self.ImageNameFind.hidden = true
        defaults.setDouble(defaults.doubleForKey("FindTotal")+1.0, forKey:"FindTotal")
        if answerSpot == 2{
            defaults.setDouble(defaults.doubleForKey("FindCorrect")+1.0, forKey:"FindCorrect")
            self.CorrectLabelFind.hidden = false
            CorrectLabelFind.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonFind.hidden = false
        }
        else{
            self.TryAgainLabelFind.hidden = false
            TryAgainLabelFind.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonFind.hidden = false
        }
    }
    @IBAction func ThirdButtonFind(sender: UIButton) {
        self.FindImage1.hidden = true
        self.FindImage2.hidden = true
        self.FindImage3.hidden = true
        self.FindImage4.hidden = true
        self.FindButton1.hidden = true
        self.FindButton2.hidden = true
        self.FindButton3.hidden = true
        self.FindButton4.hidden = true
        self.ImageNameFind.hidden = true
        defaults.setDouble(defaults.doubleForKey("FindTotal")+1.0, forKey:"FindTotal")
        if answerSpot == 3{
            defaults.setDouble(defaults.doubleForKey("FindCorrect")+1.0, forKey:"FindCorrect")
            self.CorrectLabelFind.hidden = false
            CorrectLabelFind.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonFind.hidden = false
        }
        else{
            self.TryAgainLabelFind.hidden = false
            TryAgainLabelFind.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonFind.hidden = false
        }
    }
    @IBAction func FourthButtonFind(sender: UIButton) {
        self.FindImage1.hidden = true
        self.FindImage2.hidden = true
        self.FindImage3.hidden = true
        self.FindImage4.hidden = true
        self.FindButton1.hidden = true
        self.FindButton2.hidden = true
        self.FindButton3.hidden = true
        self.FindButton4.hidden = true
        self.ImageNameFind.hidden = true
        defaults.setDouble(defaults.doubleForKey("FindTotal")+1.0, forKey:"FindTotal")
        if answerSpot == 4{
            defaults.setDouble(defaults.doubleForKey("FindCorrect")+1.0, forKey:"FindCorrect")
            self.CorrectLabelFind.hidden = false
            CorrectLabelFind.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonFind.hidden = false
        }
        else{
            self.TryAgainLabelFind.hidden = false
            TryAgainLabelFind.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonFind.hidden = false
        }
    }
        
    // Memory game randomizing the pictures on click
    @IBAction func CorrectButtonMemory(sender: UIButton) {
        self.NextButtonMemoryGame(UIButton)
        Error.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    @IBAction func NextButtonMemoryGame(sender: AnyObject?) {
        let controller: ItemTableViewController = ItemTableViewController()
        controller.update()
        
        if items.count<4 {
            self.Error.hidden = false
            self.NextButtonMemory.hidden = true
            self.CorrectLabelMemory.hidden = true
        }
        else {
            self.MemoryImage1.hidden = false
            self.MemoryImage2.hidden = false
            self.MemoryImage3.hidden = false
            self.MemoryImage4.hidden = false
            self.MemoryButton1.hidden = false
            self.MemoryButton2.hidden = false
            self.MemoryButton3.hidden = false
            self.MemoryButton4.hidden = false
            self.ImageNameMemory.hidden = false
            self.NextButtonMemory.hidden = true
            self.CorrectLabelMemory.hidden = true
        
            let randomNumber1:Int = Int(arc4random_uniform(UInt32(items.count)))
            var randomNumber2:Int = Int(arc4random_uniform(UInt32(items.count)))
            var randomNumber3:Int = Int(arc4random_uniform(UInt32(items.count)))
            var randomNumber4:Int = Int(arc4random_uniform(UInt32(items.count)))
            answerSpot = Int(arc4random_uniform(4)+1)
        
            repeat{
                randomNumber2 = Int(arc4random_uniform(UInt32(items.count)))
            }while randomNumber1 == randomNumber2
            repeat{
                randomNumber3 = Int(arc4random_uniform(UInt32(items.count)))
            }while randomNumber1 == randomNumber3 || randomNumber2 == randomNumber3
            repeat{
                randomNumber4 = Int(arc4random_uniform(UInt32(items.count)))
            }while randomNumber1 == randomNumber4 || randomNumber2 == randomNumber4 || randomNumber3 == randomNumber4
        
            self.MemoryImage1.image = items[randomNumber1].photo
            self.MemoryImage2.image = items[randomNumber2].photo
            self.MemoryImage3.image = items[randomNumber3].photo
            self.MemoryImage4.image = items[randomNumber4].photo
        
            if answerSpot==1 {
                self.ImageNameMemory.setTitle(" "+items[randomNumber1].name+" ", forState: UIControlState.Normal)
            }
            else if answerSpot==2 {
                self.ImageNameMemory.setTitle(" "+items[randomNumber2].name+" ", forState: UIControlState.Normal)
            }
            else if answerSpot==3 {
                self.ImageNameMemory.setTitle(" "+items[randomNumber3].name+" ", forState: UIControlState.Normal)
            }
            else {
                self.ImageNameMemory.setTitle(" "+items[randomNumber4].name+" ", forState: UIControlState.Normal)
            }
        }
    }
    
    // Try again, show the pictures again
    @IBAction func AlmostButtonMemory(sender: UIButton) {
        self.TryAgainButtonMemory(UIButton)
    }
    @IBAction func TryAgainButtonMemory(sender: AnyObject?) {
        self.MemoryImage1.hidden = false
        self.MemoryImage2.hidden = false
        self.MemoryImage3.hidden = false
        self.MemoryImage4.hidden = false
        self.MemoryButton1.hidden = false
        self.MemoryButton2.hidden = false
        self.MemoryButton3.hidden = false
        self.MemoryButton4.hidden = false
        self.ImageNameMemory.hidden = false
        self.TryAgainLabelMemory.hidden = true
        self.TryAgainButtonMemory.hidden = true
    }
    
    // Buttons for the Memory game's pictures.
    @IBAction func FirstButtonMemory(sender: UIButton) {
        self.MemoryImage1.hidden = true
        self.MemoryImage2.hidden = true
        self.MemoryImage3.hidden = true
        self.MemoryImage4.hidden = true
        self.MemoryButton1.hidden = true
        self.MemoryButton2.hidden = true
        self.MemoryButton3.hidden = true
        self.MemoryButton4.hidden = true
        self.ImageNameMemory.hidden = true
        defaults.setDouble(defaults.doubleForKey("MemoryTotal")+1.0, forKey:"MemoryTotal")
        if answerSpot == 1{
            defaults.setDouble(defaults.doubleForKey("MemoryCorrect")+1.0, forKey:"MemoryCorrect")
            self.CorrectLabelMemory.hidden = false
            CorrectLabelMemory.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonMemory.hidden = false
        }
        else{
            self.TryAgainLabelMemory.hidden = false
            TryAgainLabelMemory.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonMemory.hidden = false
        }
    }
    @IBAction func SecondButtonMemory(sender: UIButton) {
        self.MemoryImage1.hidden = true
        self.MemoryImage2.hidden = true
        self.MemoryImage3.hidden = true
        self.MemoryImage4.hidden = true
        self.MemoryButton1.hidden = true
        self.MemoryButton2.hidden = true
        self.MemoryButton3.hidden = true
        self.MemoryButton4.hidden = true
        self.ImageNameMemory.hidden = true
        defaults.setDouble(defaults.doubleForKey("MemoryTotal")+1.0, forKey:"MemoryTotal")
        if answerSpot == 2{
            defaults.setDouble(defaults.doubleForKey("MemoryCorrect")+1.0, forKey:"MemoryCorrect")
            self.CorrectLabelMemory.hidden = false
            CorrectLabelMemory.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonMemory.hidden = false
        }
        else{
            self.TryAgainLabelMemory.hidden = false
            TryAgainLabelMemory.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonMemory.hidden = false
        }
    }
    @IBAction func ThirdButtonMemory(sender: UIButton) {
        self.MemoryImage1.hidden = true
        self.MemoryImage2.hidden = true
        self.MemoryImage3.hidden = true
        self.MemoryImage4.hidden = true
        self.MemoryButton1.hidden = true
        self.MemoryButton2.hidden = true
        self.MemoryButton3.hidden = true
        self.MemoryButton4.hidden = true
        self.ImageNameMemory.hidden = true
        defaults.setDouble(defaults.doubleForKey("MemoryTotal")+1.0, forKey:"MemoryTotal")
        if answerSpot == 3{
            defaults.setDouble(defaults.doubleForKey("MemoryCorrect")+1.0, forKey:"MemoryCorrect")
            self.CorrectLabelMemory.hidden = false
            CorrectLabelMemory.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonMemory.hidden = false
        }
        else{
            self.TryAgainLabelMemory.hidden = false
            TryAgainLabelMemory.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonMemory.hidden = false
        }
    }
    @IBAction func FourthButtonMemory(sender: UIButton) {
        self.MemoryImage1.hidden = true
        self.MemoryImage2.hidden = true
        self.MemoryImage3.hidden = true
        self.MemoryImage4.hidden = true
        self.MemoryButton1.hidden = true
        self.MemoryButton2.hidden = true
        self.MemoryButton3.hidden = true
        self.MemoryButton4.hidden = true
        self.ImageNameMemory.hidden = true
        defaults.setDouble(defaults.doubleForKey("MemoryTotal")+1.0, forKey:"MemoryTotal")
        if answerSpot == 4{
            defaults.setDouble(defaults.doubleForKey("MemoryCorrect")+1.0, forKey:"MemoryCorrect")
            self.CorrectLabelMemory.hidden = false
            CorrectLabelMemory.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonMemory.hidden = false
        }
        else{
            self.TryAgainLabelMemory.hidden = false
            TryAgainLabelMemory.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonMemory.hidden = false
        }
    }
    
    // Function that calculates the scores for each game and allows scoresViewController to access them.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if segue.identifier! == "ScoresButton" {
            if (defaults.doubleForKey("OddOneTotal")>0.0) {
                defaults.setInteger(Int(round((defaults.doubleForKey("OddOneCorrect")/defaults.doubleForKey("OddOneTotal"))*100)), forKey:"OddOnePercentage")
            }
            if (defaults.doubleForKey("FindTotal")>0.0) {
                defaults.setInteger(Int(round((defaults.doubleForKey("FindCorrect")/defaults.doubleForKey("FindTotal"))*100)), forKey:"FindPercentage")
            }
            if (defaults.doubleForKey("AddTotal")>0.0) {
                defaults.setInteger(Int(round((defaults.doubleForKey("AddCorrect")/defaults.doubleForKey("AddTotal"))*100)), forKey:"AddPercentage")
            }
            if (defaults.doubleForKey("SubtractTotal")>0.0) {
                defaults.setInteger(Int(round((defaults.doubleForKey("SubtractCorrect")/defaults.doubleForKey("SubtractTotal"))*100)), forKey:"SubtractPercentage")
            }
            if (defaults.doubleForKey("MultiplyTotal")>0.0) {
                defaults.setInteger(Int(round((defaults.doubleForKey("MultiplyCorrect")/defaults.doubleForKey("MultiplyTotal"))*100)), forKey:"MultiplyPercentage")
            }
            if (defaults.doubleForKey("DivideTotal")>0.0) {
                defaults.setInteger(Int(round((defaults.doubleForKey("DivideCorrect")/defaults.doubleForKey("DivideTotal"))*100)), forKey:"DividePercentage")
            }
            if (defaults.doubleForKey("MemoryTotal")>0.0) {
                defaults.setInteger(Int(round((defaults.doubleForKey("MemoryCorrect")/defaults.doubleForKey("MemoryTotal"))*100)), forKey:"MemoryPercentage")
            }
        }
        if (segue.identifier! == "OddOneStartButton" || segue.identifier! == "OddOneMiddleButton"){
            let viewController = UIStoryboard(name: "Games", bundle: nil).instantiateViewControllerWithIdentifier("OddOneGame") as UIViewController
            viewController.viewDidAppear(true)
            if viewController == self{
                self.NextButtonOddOne(UIButton)
            }
        }
    }
}