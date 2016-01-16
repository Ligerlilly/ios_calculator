//
//  ViewController.swift
//  Calculator
//
//  Created by Interns on 1/6/16.
//  Copyright (c) 2016 Jason Lane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    var operandStack = [String]()
    var sumInDisplay = false
    var operatorJustUsed = false
    let brain = CalculatorBrain()


    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        
            if brain.operandStackCount() > 0 && operatorJustUsed == false {
                brain.appendCurrentlyPressedPlusDisplay(digit)
            }
            else {
                brain.appendStack(digit)
                operatorJustUsed = false
            }
        }
        else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
            brain.appendStack(digit)
            
        }
    }
   
    
    @IBAction func appendOperator(sender: UIButton) {
        let sign = sender.currentTitle!
        operatorJustUsed = true
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + sign
            brain.appendStack(sign)
        }
        else if sumInDisplay {
            display.text = display.text! + sign
            brain.appendStack(sign)
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func enter() {
        sumInDisplay = true
        userIsInTheMiddleOfTypingANumber = false
        display.text = "\(brain.calculate()!)"
    }
    
    @IBAction func clear() {
        userIsInTheMiddleOfTypingANumber = false
        brain.clear()
        display.text = "0"
        
    }
}

