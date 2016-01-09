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


    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        
            if operandStack.count > 0 && operatorJustUsed == false {
                operandStack.append("\(operandStack.removeLast())" + "\(digit)")
            }
            else {
                operandStack.append(digit)
                operatorJustUsed = false
            }
        }
        else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
            operandStack.append(digit)
            
        }
    }
   
    
    @IBAction func appendOperator(sender: UIButton) {
        let sign = sender.currentTitle!
        operatorJustUsed = true
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + sign
            operandStack.append(sign)
        }
        else if sumInDisplay {
            display.text = display.text! + sign
            operandStack.append(sign)
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func enter() {
        sumInDisplay = true
        println("stack = \(operandStack)")
        var total: Double = 0
        var i = 0
        while contains(operandStack, "✖️") {
            switch operandStack[i] {
            case "✖️":
                total = NSNumberFormatter().numberFromString(operandStack[i-1])!.doubleValue * NSNumberFormatter().numberFromString(operandStack[i+1])!.doubleValue
                operandStack.removeRange(i-1...i)
                if operandStack.count > 2 {
                    operandStack[i-1] = "\(total)"
                }
                
                i = 0
                println("stack = \(operandStack)")
            default: break
            }
            i++
        }
        while contains(operandStack, "➗") {
            switch operandStack[i] {
            case "➗":
                total = NSNumberFormatter().numberFromString(operandStack[i-1])!.doubleValue / NSNumberFormatter().numberFromString(operandStack[i+1])!.doubleValue
                operandStack.removeRange(i-1...i)
                if operandStack.count > 2 {
                    operandStack[i-1] = "\(total)"
                }
                
                i = 0
                println("stack = \(operandStack)")
            default: break
            }
            i++
        }
        while contains(operandStack, "➕") {
            switch operandStack[i] {
            case "➕":
                total = NSNumberFormatter().numberFromString(operandStack[i-1])!.doubleValue + NSNumberFormatter().numberFromString(operandStack[i+1])!.doubleValue
                operandStack.removeRange(i-1...i)
                if operandStack.count > 2 {
                    operandStack[i-1] = "\(total)"
                }

                i = 0
                println("stack = \(operandStack)")
            default: break
            }
            i++
        }
        while contains(operandStack, "➖") {
            switch operandStack[i] {
            case "➖":
                total = NSNumberFormatter().numberFromString(operandStack[i-1])!.doubleValue - NSNumberFormatter().numberFromString(operandStack[i+1])!.doubleValue
                operandStack.removeRange(i-1...i)
                if operandStack.count > 2 {
                    operandStack[i-1] = "\(total)"
                }
                
                i = 0
                println("stack = \(operandStack)")
            default: break
            }
            i++
        }

        display.text = "\(total)"
        operandStack = []
        operandStack.append("\(total)")
        userIsInTheMiddleOfTypingANumber = false
        println("stack = \(operandStack)")
    }
    
    @IBAction func clear() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack = []
        display.text = "0"
    }
}

