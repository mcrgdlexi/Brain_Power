//
//  MathViewController.swift
//  Brain_Power
//
//  Created by Alexis Miller on 3/24/16.
//  Copyright © 2016 Alexis Miller. All rights reserved.
//

import Foundation
import UIKit

class MathViewController: UIViewController {
    
    var defaults = NSUserDefaults.standardUserDefaults()
    var answerSpot=2
    
    // Add game images that will be changing
    @IBOutlet weak var AddImage1: UIButton!
    @IBOutlet weak var AddImage2: UIButton!
    @IBOutlet weak var AddImage3: UIButton!
    @IBOutlet weak var AddImage4: UIButton!
    
    // Buttons for the Add game
    @IBOutlet weak var ImageNameAdd: UIButton!
    @IBOutlet weak var NextButtonAdd: UIButton!
    @IBOutlet weak var TryAgainButtonAdd: UIButton!
    @IBOutlet weak var CorrectLabelAdd: UIButton!
    @IBOutlet weak var TryAgainLabelAdd: UIButton!
    
    // Subtract game images that will be changing
    @IBOutlet weak var SubtractImage1: UIButton!
    @IBOutlet weak var SubtractImage2: UIButton!
    @IBOutlet weak var SubtractImage3: UIButton!
    @IBOutlet weak var SubtractImage4: UIButton!
    
    // Buttons for the Subtract game
    @IBOutlet weak var ImageNameSubtract: UIButton!
    @IBOutlet weak var NextButtonSubtract: UIButton!
    @IBOutlet weak var TryAgainButtonSubtract: UIButton!
    @IBOutlet weak var CorrectLabelSubtract: UIButton!
    @IBOutlet weak var TryAgainLabelSubtract: UIButton!
    
    // Multiply game images that will be changing
    @IBOutlet weak var MultiplyImage1: UIButton!
    @IBOutlet weak var MultiplyImage2: UIButton!
    @IBOutlet weak var MultiplyImage3: UIButton!
    @IBOutlet weak var MultiplyImage4: UIButton!
    
    // Buttons for the Multiply game
    @IBOutlet weak var ImageNameMultiply: UIButton!
    @IBOutlet weak var NextButtonMultiply: UIButton!
    @IBOutlet weak var TryAgainButtonMultiply: UIButton!
    @IBOutlet weak var CorrectLabelMultiply: UIButton!
    @IBOutlet weak var TryAgainLabelMultiply: UIButton!
    
    // Divide game images that will be changing
    @IBOutlet weak var DivideImage1: UIButton!
    @IBOutlet weak var DivideImage2: UIButton!
    @IBOutlet weak var DivideImage3: UIButton!
    @IBOutlet weak var DivideImage4: UIButton!
    
    // Buttons for the Divide game
    @IBOutlet weak var ImageNameDivide: UIButton!
    @IBOutlet weak var NextButtonDivide: UIButton!
    @IBOutlet weak var TryAgainButtonDivide: UIButton!
    @IBOutlet weak var CorrectLabelDivide: UIButton!
    @IBOutlet weak var TryAgainLabelDivide: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Add game randomizing the pictures on click
    @IBAction func CorrectButtonAdd(sender: UIButton) {
        self.AddNextButton(UIButton)
    }
    @IBAction func AddNextButton(sender: AnyObject?) {
        self.AddImage1.hidden = false
        self.AddImage2.hidden = false
        self.AddImage3.hidden = false
        self.AddImage4.hidden = false
        self.ImageNameAdd.hidden = false
        self.NextButtonAdd.hidden = true
        self.CorrectLabelAdd.hidden = true
        
        let randomNumber1:Int = Int(arc4random_uniform(10))
        let randomNumber2:Int = Int(arc4random_uniform(10))
        answerSpot = Int(arc4random_uniform(4)+1)
        
        self.ImageNameAdd.setTitle(String(format: " %i + %i = ", randomNumber1, randomNumber2), forState: UIControlState.Normal)
        
        if answerSpot==1 {
            self.AddImage1.setTitle(String(randomNumber1+randomNumber2), forState: UIControlState.Normal)
            self.AddImage2.setTitle(String(randomNumber1+randomNumber2-1), forState: UIControlState.Normal)
            self.AddImage3.setTitle(String(randomNumber1+randomNumber2+1), forState: UIControlState.Normal)
            self.AddImage4.setTitle(String(randomNumber1+randomNumber2-2), forState: UIControlState.Normal)
        }
        else if answerSpot==2 {
            self.AddImage1.setTitle(String(randomNumber1+randomNumber2-1), forState: UIControlState.Normal)
            self.AddImage2.setTitle(String(randomNumber1+randomNumber2), forState: UIControlState.Normal)
            self.AddImage3.setTitle(String(randomNumber1+randomNumber2+1), forState: UIControlState.Normal)
            self.AddImage4.setTitle(String(randomNumber1+randomNumber2+2), forState: UIControlState.Normal)
        }
        else if answerSpot==3 {
            self.AddImage1.setTitle(String(randomNumber1+randomNumber2+1), forState: UIControlState.Normal)
            self.AddImage2.setTitle(String(randomNumber1+randomNumber2-1), forState: UIControlState.Normal)
            self.AddImage3.setTitle(String(randomNumber1+randomNumber2), forState: UIControlState.Normal)
            self.AddImage4.setTitle(String(randomNumber1+randomNumber2-2), forState: UIControlState.Normal)
        }
        else {
            self.AddImage1.setTitle(String(randomNumber1+randomNumber2+2), forState: UIControlState.Normal)
            self.AddImage2.setTitle(String(randomNumber1+randomNumber2-1), forState: UIControlState.Normal)
            self.AddImage3.setTitle(String(randomNumber1+randomNumber2+1), forState: UIControlState.Normal)
            self.AddImage4.setTitle(String(randomNumber1+randomNumber2), forState: UIControlState.Normal)
        }
    }
    
    // Try again, show the pictures again
    @IBAction func AlmostButtonAdd(sender: UIButton) {
        self.TryAgainButtonAdd(UIButton)
    }
    @IBAction func TryAgainButtonAdd(sender: AnyObject?) {
        self.AddImage1.hidden = false
        self.AddImage2.hidden = false
        self.AddImage3.hidden = false
        self.AddImage4.hidden = false
        self.ImageNameAdd.hidden = false
        self.TryAgainLabelAdd.hidden = true
        self.TryAgainButtonAdd.hidden = true
    }
    
    // Buttons for the Add game's pictures.
    @IBAction func FirstButtonAdd(sender: UIButton) {
        self.AddImage1.hidden = true
        self.AddImage2.hidden = true
        self.AddImage3.hidden = true
        self.AddImage4.hidden = true
        self.ImageNameAdd.hidden = true
        defaults.setDouble(defaults.doubleForKey("AddTotal")+1.0, forKey:"AddTotal")
        if answerSpot == 1{
            defaults.setDouble(defaults.doubleForKey("AddCorrect")+1.0, forKey:"AddCorrect")
            self.CorrectLabelAdd.hidden = false
            CorrectLabelAdd.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonAdd.hidden = false
        }
        else{
            self.TryAgainLabelAdd.hidden = false
            TryAgainLabelAdd.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonAdd.hidden = false
        }
    }
    @IBAction func SecondButtonAdd(sender: UIButton) {
        self.AddImage1.hidden = true
        self.AddImage2.hidden = true
        self.AddImage3.hidden = true
        self.AddImage4.hidden = true
        self.ImageNameAdd.hidden = true
        defaults.setDouble(defaults.doubleForKey("AddTotal")+1.0, forKey:"AddTotal")
        if answerSpot == 2{
            defaults.setDouble(defaults.doubleForKey("AddCorrect")+1.0, forKey:"AddCorrect")
            self.CorrectLabelAdd.hidden = false
            CorrectLabelAdd.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonAdd.hidden = false
        }
        else{
            self.TryAgainLabelAdd.hidden = false
            TryAgainLabelAdd.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonAdd.hidden = false
        }
    }
    @IBAction func ThirdButtonAdd(sender: UIButton) {
        self.AddImage1.hidden = true
        self.AddImage2.hidden = true
        self.AddImage3.hidden = true
        self.AddImage4.hidden = true
        self.ImageNameAdd.hidden = true
        defaults.setDouble(defaults.doubleForKey("AddTotal")+1.0, forKey:"AddTotal")
        if answerSpot == 3{
            defaults.setDouble(defaults.doubleForKey("AddCorrect")+1.0, forKey:"AddCorrect")
            self.CorrectLabelAdd.hidden = false
            CorrectLabelAdd.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonAdd.hidden = false
        }
        else{
            self.TryAgainLabelAdd.hidden = false
            TryAgainLabelAdd.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonAdd.hidden = false
        }
    }
    @IBAction func FourthButtonAdd(sender: UIButton) {
        self.AddImage1.hidden = true
        self.AddImage2.hidden = true
        self.AddImage3.hidden = true
        self.AddImage4.hidden = true
        self.ImageNameAdd.hidden = true
        defaults.setDouble(defaults.doubleForKey("AddTotal")+1.0, forKey:"AddTotal")
        if answerSpot == 4{
            defaults.setDouble(defaults.doubleForKey("AddCorrect")+1.0, forKey:"AddCorrect")
            self.CorrectLabelAdd.hidden = false
            CorrectLabelAdd.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonAdd.hidden = false
        }
        else{
            self.TryAgainLabelAdd.hidden = false
            TryAgainLabelAdd.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonAdd.hidden = false
        }
    }
    
    // Subtract game randomizing the pictures on click
    @IBAction func CorrectButtonSubtract(sender: UIButton) {
        self.SubtractNextButton(UIButton)
    }
    @IBAction func SubtractNextButton(sender: AnyObject?) {
        self.SubtractImage1.hidden = false
        self.SubtractImage2.hidden = false
        self.SubtractImage3.hidden = false
        self.SubtractImage4.hidden = false
        self.ImageNameSubtract.hidden = false
        self.NextButtonSubtract.hidden = true
        self.CorrectLabelSubtract.hidden = true
        
        var randomNumber1:Int = Int(arc4random_uniform(10))
        var randomNumber2:Int = Int(arc4random_uniform(10))
        answerSpot = Int(arc4random_uniform(4)+1)
        
        if(randomNumber1<randomNumber2){
            let temp = randomNumber1
            randomNumber1 = randomNumber2
            randomNumber2 = temp
        }
        
        self.ImageNameSubtract.setTitle(String(format: " %i - %i = ", randomNumber1, randomNumber2), forState: UIControlState.Normal)
        
        if answerSpot==1 {
            self.SubtractImage1.setTitle(String(randomNumber1-randomNumber2), forState: UIControlState.Normal)
            self.SubtractImage2.setTitle(String(randomNumber1-randomNumber2-1), forState: UIControlState.Normal)
            self.SubtractImage3.setTitle(String(randomNumber1-randomNumber2+1), forState: UIControlState.Normal)
            self.SubtractImage4.setTitle(String(randomNumber1-randomNumber2-2), forState: UIControlState.Normal)
        }
        else if answerSpot==2 {
            self.SubtractImage1.setTitle(String(randomNumber1-randomNumber2-1), forState: UIControlState.Normal)
            self.SubtractImage2.setTitle(String(randomNumber1-randomNumber2), forState: UIControlState.Normal)
            self.SubtractImage3.setTitle(String(randomNumber1-randomNumber2+1), forState: UIControlState.Normal)
            self.SubtractImage4.setTitle(String(randomNumber1-randomNumber2+2), forState: UIControlState.Normal)
        }
        else if answerSpot==3 {
            self.SubtractImage1.setTitle(String(randomNumber1-randomNumber2+1), forState: UIControlState.Normal)
            self.SubtractImage2.setTitle(String(randomNumber1-randomNumber2-1), forState: UIControlState.Normal)
            self.SubtractImage3.setTitle(String(randomNumber1-randomNumber2), forState: UIControlState.Normal)
            self.SubtractImage4.setTitle(String(randomNumber1-randomNumber2-2), forState: UIControlState.Normal)
        }
        else {
            self.SubtractImage1.setTitle(String(randomNumber1-randomNumber2+2), forState: UIControlState.Normal)
            self.SubtractImage2.setTitle(String(randomNumber1-randomNumber2-1), forState: UIControlState.Normal)
            self.SubtractImage3.setTitle(String(randomNumber1-randomNumber2+1), forState: UIControlState.Normal)
            self.SubtractImage4.setTitle(String(randomNumber1-randomNumber2), forState: UIControlState.Normal)
        }
    }
    
    // Try again, show the pictures again
    @IBAction func AlmostButtonSubtract(sender: UIButton) {
        self.TryAgainButtonSubtract(UIButton)
    }
    @IBAction func TryAgainButtonSubtract(sender: AnyObject?) {
        self.SubtractImage1.hidden = false
        self.SubtractImage2.hidden = false
        self.SubtractImage3.hidden = false
        self.SubtractImage4.hidden = false
        self.ImageNameSubtract.hidden = false
        self.TryAgainLabelSubtract.hidden = true
        self.TryAgainButtonSubtract.hidden = true
    }
    
    // Buttons for the Subtract game's pictures.
    @IBAction func FirstButtonSubtract(sender: UIButton) {
        self.SubtractImage1.hidden = true
        self.SubtractImage2.hidden = true
        self.SubtractImage3.hidden = true
        self.SubtractImage4.hidden = true
        self.ImageNameSubtract.hidden = true
        defaults.setDouble(defaults.doubleForKey("SubtractTotal")+1.0, forKey:"SubtractTotal")
        if answerSpot == 1{
            defaults.setDouble(defaults.doubleForKey ("SubtractCorrect")+1.0, forKey:"SubtractCorrect")
            self.CorrectLabelSubtract.hidden = false
            CorrectLabelSubtract.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonSubtract.hidden = false
        }
        else{
            self.TryAgainLabelSubtract.hidden = false
            TryAgainLabelSubtract.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonSubtract.hidden = false
        }
    }
    @IBAction func SecondButtonSubtract(sender: UIButton) {
        self.SubtractImage1.hidden = true
        self.SubtractImage2.hidden = true
        self.SubtractImage3.hidden = true
        self.SubtractImage4.hidden = true
        self.ImageNameSubtract.hidden = true
        defaults.setDouble(defaults.doubleForKey("SubtractTotal")+1.0, forKey:"SubtractTotal")
        if answerSpot == 2{
            defaults.setDouble(defaults.doubleForKey ("SubtractCorrect")+1.0, forKey:"SubtractCorrect")
            self.CorrectLabelSubtract.hidden = false
            CorrectLabelSubtract.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonSubtract.hidden = false
        }
        else{
            self.TryAgainLabelSubtract.hidden = false
            TryAgainLabelSubtract.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonSubtract.hidden = false
        }
    }
    @IBAction func ThirdButtonSubtract(sender: UIButton) {
        self.SubtractImage1.hidden = true
        self.SubtractImage2.hidden = true
        self.SubtractImage3.hidden = true
        self.SubtractImage4.hidden = true
        self.ImageNameSubtract.hidden = true
        defaults.setDouble(defaults.doubleForKey("SubtractTotal")+1.0, forKey:"SubtractTotal")
        if answerSpot == 3{
            defaults.setDouble(defaults.doubleForKey ("SubtractCorrect")+1.0, forKey:"SubtractCorrect")
            self.CorrectLabelSubtract.hidden = false
            CorrectLabelSubtract.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonSubtract.hidden = false
        }
        else{
            self.TryAgainLabelSubtract.hidden = false
            TryAgainLabelSubtract.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonSubtract.hidden = false
        }
    }
    @IBAction func FourthButtonSubtract(sender: UIButton) {
        self.SubtractImage1.hidden = true
        self.SubtractImage2.hidden = true
        self.SubtractImage3.hidden = true
        self.SubtractImage4.hidden = true
        self.ImageNameSubtract.hidden = true
        defaults.setDouble(defaults.doubleForKey("SubtractTotal")+1.0, forKey:"SubtractTotal")
        if answerSpot == 4{
            defaults.setDouble(defaults.doubleForKey ("SubtractCorrect")+1.0, forKey:"SubtractCorrect")
            self.CorrectLabelSubtract.hidden = false
            CorrectLabelSubtract.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonSubtract.hidden = false
        }
        else{
            self.TryAgainLabelSubtract.hidden = false
            TryAgainLabelSubtract.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonSubtract.hidden = false
        }
    }
    
    // Multiply game randomizing the pictures on click
    @IBAction func CorrectButtonMultiply(sender: UIButton) {
        self.MultiplyNextButton(UIButton)
    }
    @IBAction func MultiplyNextButton(sender: AnyObject?) {
        self.MultiplyImage1.hidden = false
        self.MultiplyImage2.hidden = false
        self.MultiplyImage3.hidden = false
        self.MultiplyImage4.hidden = false
        self.ImageNameMultiply.hidden = false
        self.NextButtonMultiply.hidden = true
        self.CorrectLabelMultiply.hidden = true
        
        let randomNumber1:Int = Int(arc4random_uniform(9)+1)
        let randomNumber2:Int = Int(arc4random_uniform(10))
        answerSpot = Int(arc4random_uniform(4)+1)
        
        self.ImageNameMultiply.setTitle(String(format: " %i x %i = ", randomNumber1, randomNumber2), forState: UIControlState.Normal)
        
        if answerSpot==1 {
            self.MultiplyImage1.setTitle(String(randomNumber1*randomNumber2), forState: UIControlState.Normal)
            self.MultiplyImage2.setTitle(String(randomNumber1*(randomNumber2-1)), forState: UIControlState.Normal)
            self.MultiplyImage3.setTitle(String(randomNumber1*(randomNumber2+1)), forState: UIControlState.Normal)
            self.MultiplyImage4.setTitle(String(randomNumber1*(randomNumber2-2)), forState: UIControlState.Normal)
        }
        else if answerSpot==2 {
            self.MultiplyImage1.setTitle(String(randomNumber1*(randomNumber2-1)), forState: UIControlState.Normal)
            self.MultiplyImage2.setTitle(String(randomNumber1*randomNumber2), forState: UIControlState.Normal)
            self.MultiplyImage3.setTitle(String(randomNumber1*(randomNumber2+1)), forState: UIControlState.Normal)
            self.MultiplyImage4.setTitle(String(randomNumber1*(randomNumber2+2)), forState: UIControlState.Normal)
        }
        else if answerSpot==3 {
            self.MultiplyImage1.setTitle(String(randomNumber1*(randomNumber2+1)), forState: UIControlState.Normal)
            self.MultiplyImage2.setTitle(String(randomNumber1*(randomNumber2-1)), forState: UIControlState.Normal)
            self.MultiplyImage3.setTitle(String(randomNumber1*randomNumber2), forState: UIControlState.Normal)
            self.MultiplyImage4.setTitle(String(randomNumber1*(randomNumber2-2)), forState: UIControlState.Normal)
        }
        else {
            self.MultiplyImage1.setTitle(String(randomNumber1*(randomNumber2+2)), forState: UIControlState.Normal)
            self.MultiplyImage2.setTitle(String(randomNumber1*(randomNumber2-1)), forState: UIControlState.Normal)
            self.MultiplyImage3.setTitle(String(randomNumber1*(randomNumber2+1)), forState: UIControlState.Normal)
            self.MultiplyImage4.setTitle(String(randomNumber1*randomNumber2), forState: UIControlState.Normal)
        }
    }
    
    // Try again, show the pictures again
    @IBAction func AlmostButtonMultiply(sender: UIButton) {
        self.TryAgainButtonMultiply(UIButton)
    }
    @IBAction func TryAgainButtonMultiply(sender: AnyObject?) {
        self.MultiplyImage1.hidden = false
        self.MultiplyImage2.hidden = false
        self.MultiplyImage3.hidden = false
        self.MultiplyImage4.hidden = false
        self.ImageNameMultiply.hidden = false
        self.TryAgainLabelMultiply.hidden = true
        self.TryAgainButtonMultiply.hidden = true
    }
    
    // Buttons for the Multiply game's pictures.
    @IBAction func FirstButtonMultiply(sender: UIButton) {
        self.MultiplyImage1.hidden = true
        self.MultiplyImage2.hidden = true
        self.MultiplyImage3.hidden = true
        self.MultiplyImage4.hidden = true
        self.ImageNameMultiply.hidden = true
        defaults.setDouble(defaults.doubleForKey("MultiplyTotal")+1.0, forKey:"MultiplyTotal")
        if answerSpot == 1{
            defaults.setDouble(defaults.doubleForKey ("MultiplyCorrect")+1.0, forKey:"MultiplyCorrect")
            self.CorrectLabelMultiply.hidden = false
            CorrectLabelMultiply.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonMultiply.hidden = false
        }
        else{
            self.TryAgainLabelMultiply.hidden = false
            TryAgainLabelMultiply.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonMultiply.hidden = false
        }
    }
    @IBAction func SecondButtonMultiply(sender: UIButton) {
        self.MultiplyImage1.hidden = true
        self.MultiplyImage2.hidden = true
        self.MultiplyImage3.hidden = true
        self.MultiplyImage4.hidden = true
        self.ImageNameMultiply.hidden = true
        defaults.setDouble(defaults.doubleForKey("MultiplyTotal")+1.0, forKey:"MultiplyTotal")
        if answerSpot == 2{
            defaults.setDouble(defaults.doubleForKey ("MultiplyCorrect")+1.0, forKey:"MultiplyCorrect")
            self.CorrectLabelMultiply.hidden = false
            CorrectLabelMultiply.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonMultiply.hidden = false
        }
        else{
            self.TryAgainLabelMultiply.hidden = false
            TryAgainLabelMultiply.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonMultiply.hidden = false
        }
    }
    @IBAction func ThirdButtonMultiply(sender: UIButton) {
        self.MultiplyImage1.hidden = true
        self.MultiplyImage2.hidden = true
        self.MultiplyImage3.hidden = true
        self.MultiplyImage4.hidden = true
        self.ImageNameMultiply.hidden = true
        defaults.setDouble(defaults.doubleForKey("MultiplyTotal")+1.0, forKey:"MultiplyTotal")
        if answerSpot == 3{
            defaults.setDouble(defaults.doubleForKey ("MultiplyCorrect")+1.0, forKey:"MultiplyCorrect")
            self.CorrectLabelMultiply.hidden = false
            CorrectLabelMultiply.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonMultiply.hidden = false
        }
        else{
            self.TryAgainLabelMultiply.hidden = false
            TryAgainLabelMultiply.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonMultiply.hidden = false
        }
    }
    @IBAction func FourthButtonMultiply(sender: UIButton) {
        self.MultiplyImage1.hidden = true
        self.MultiplyImage2.hidden = true
        self.MultiplyImage3.hidden = true
        self.MultiplyImage4.hidden = true
        self.ImageNameMultiply.hidden = true
        defaults.setDouble(defaults.doubleForKey("MultiplyTotal")+1.0, forKey:"MultiplyTotal")
        if answerSpot == 4{
            defaults.setDouble(defaults.doubleForKey ("MultiplyCorrect")+1.0, forKey:"MultiplyCorrect")
            self.CorrectLabelMultiply.hidden = false
            CorrectLabelMultiply.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonMultiply.hidden = false
        }
        else{
            self.TryAgainLabelMultiply.hidden = false
            TryAgainLabelMultiply.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonMultiply.hidden = false
        }
    }
    
    // Divide game randomizing the pictures on click
    @IBAction func CorrectButtonDivide(sender: UIButton) {
        self.DivideNextButton(UIButton)
    }
    @IBAction func DivideNextButton(sender: AnyObject?) {
        self.DivideImage1.hidden = false
        self.DivideImage2.hidden = false
        self.DivideImage3.hidden = false
        self.DivideImage4.hidden = false
        self.ImageNameDivide.hidden = false
        self.NextButtonDivide.hidden = true
        self.CorrectLabelDivide.hidden = true
        
        let randomNumber1:Int = Int(arc4random_uniform(9)+1)
        let randomNumber2:Int = Int(arc4random_uniform(9)+1)
        answerSpot = Int(arc4random_uniform(4)+1)
        
        self.ImageNameDivide.setTitle(String(format: " %i ÷ %i = ", (randomNumber1*randomNumber2), randomNumber2), forState: UIControlState.Normal)
        
        if answerSpot==1 {
            self.DivideImage1.setTitle(String(randomNumber1), forState: UIControlState.Normal)
            self.DivideImage2.setTitle(String(randomNumber1-1), forState: UIControlState.Normal)
            self.DivideImage3.setTitle(String(randomNumber1+1), forState: UIControlState.Normal)
            self.DivideImage4.setTitle(String(randomNumber1-2), forState: UIControlState.Normal)
        }
        else if answerSpot==2 {
            self.DivideImage1.setTitle(String(randomNumber1-1), forState: UIControlState.Normal)
            self.DivideImage2.setTitle(String(randomNumber1), forState: UIControlState.Normal)
            self.DivideImage3.setTitle(String(randomNumber1+1), forState: UIControlState.Normal)
            self.DivideImage4.setTitle(String(randomNumber1+2), forState: UIControlState.Normal)
        }
        else if answerSpot==3 {
            self.DivideImage1.setTitle(String(randomNumber1+1), forState: UIControlState.Normal)
            self.DivideImage2.setTitle(String(randomNumber1-1), forState: UIControlState.Normal)
            self.DivideImage3.setTitle(String(randomNumber1), forState: UIControlState.Normal)
            self.DivideImage4.setTitle(String(randomNumber1-2), forState: UIControlState.Normal)
        }
        else {
            self.DivideImage1.setTitle(String(randomNumber1+2), forState: UIControlState.Normal)
            self.DivideImage2.setTitle(String(randomNumber1-1), forState: UIControlState.Normal)
            self.DivideImage3.setTitle(String(randomNumber1+1), forState: UIControlState.Normal)
            self.DivideImage4.setTitle(String(randomNumber1), forState: UIControlState.Normal)
        }
    }
    
    // Try again, show the pictures again
    @IBAction func AlmostButtonDivide(sender: UIButton) {
        self.TryAgainButtonDivide(UIButton)
    }
    @IBAction func TryAgainButtonDivide(sender: AnyObject?) {
        self.DivideImage1.hidden = false
        self.DivideImage2.hidden = false
        self.DivideImage3.hidden = false
        self.DivideImage4.hidden = false
        self.ImageNameDivide.hidden = false
        self.TryAgainLabelDivide.hidden = true
        self.TryAgainButtonDivide.hidden = true
    }
    
    // Buttons for the Divide game's pictures.
    @IBAction func FirstButtonDivide(sender: UIButton) {
        self.DivideImage1.hidden = true
        self.DivideImage2.hidden = true
        self.DivideImage3.hidden = true
        self.DivideImage4.hidden = true
        self.ImageNameDivide.hidden = true
        defaults.setDouble(defaults.doubleForKey("DivideTotal")+1.0, forKey:"DivideTotal")
        if answerSpot == 1{
            defaults.setDouble(defaults.doubleForKey("DivideCorrect")+1.0, forKey:"DivideCorrect")
            self.CorrectLabelDivide.hidden = false
            CorrectLabelDivide.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonDivide.hidden = false
        }
        else{
            self.TryAgainLabelDivide.hidden = false
            TryAgainLabelDivide.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonDivide.hidden = false
        }
    }
    @IBAction func SecondButtonDivide(sender: UIButton) {
        self.DivideImage1.hidden = true
        self.DivideImage2.hidden = true
        self.DivideImage3.hidden = true
        self.DivideImage4.hidden = true
        self.ImageNameDivide.hidden = true
        defaults.setDouble(defaults.doubleForKey("DivideTotal")+1.0, forKey:"DivideTotal")
        if answerSpot == 2{
            defaults.setDouble(defaults.doubleForKey("DivideCorrect")+1.0, forKey:"DivideCorrect")
            self.CorrectLabelDivide.hidden = false
            CorrectLabelDivide.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonDivide.hidden = false
        }
        else{
            self.TryAgainLabelDivide.hidden = false
            TryAgainLabelDivide.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonDivide.hidden = false
        }
    }
    @IBAction func ThirdButtonDivide(sender: UIButton) {
        self.DivideImage1.hidden = true
        self.DivideImage2.hidden = true
        self.DivideImage3.hidden = true
        self.DivideImage4.hidden = true
        self.ImageNameDivide.hidden = true
        defaults.setDouble(defaults.doubleForKey("DivideTotal")+1.0, forKey:"DivideTotal")
        if answerSpot == 3{
            defaults.setDouble(defaults.doubleForKey("DivideCorrect")+1.0, forKey:"DivideCorrect")
            self.CorrectLabelDivide.hidden = false
            CorrectLabelDivide.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonDivide.hidden = false
        }
        else{
            self.TryAgainLabelDivide.hidden = false
            TryAgainLabelDivide.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonDivide.hidden = false
        }
    }
    @IBAction func FourthButtonDivide(sender: UIButton) {
        self.DivideImage1.hidden = true
        self.DivideImage2.hidden = true
        self.DivideImage3.hidden = true
        self.DivideImage4.hidden = true
        self.ImageNameDivide.hidden = true
        defaults.setDouble(defaults.doubleForKey("DivideTotal")+1.0, forKey:"DivideTotal")
        if answerSpot == 4{
            defaults.setDouble(defaults.doubleForKey("DivideCorrect")+1.0, forKey:"DivideCorrect")
            self.CorrectLabelDivide.hidden = false
            CorrectLabelDivide.titleLabel?.adjustsFontSizeToFitWidth = true
            self.NextButtonDivide.hidden = false
        }
        else{
            self.TryAgainLabelDivide.hidden = false
            TryAgainLabelDivide.titleLabel?.adjustsFontSizeToFitWidth = true
            self.TryAgainButtonDivide.hidden = false
        }
    }
}