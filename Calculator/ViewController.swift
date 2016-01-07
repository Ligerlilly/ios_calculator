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

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println("\(displayValue)")
        
    }
    
    @IBAction func operate(sender: UIButton) {
       let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        switch operation {
        case "✖️": performOperation {$0 * $1}
        default: break
//        case ➗:
//        case ➕:
//        case ➖:
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
          displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
          enter()
        }
        
    }
    var displayValue: Double {
        get {
           return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

