//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Interns on 1/9/16.
//  Copyright (c) 2016 Jason Lane. All rights reserved.
//

import Foundation

class CalculatorBrain {
    var operandStack = [String]()
    
    func appendStack(item: String) {
        operandStack.append(item)
    }
    
    func calculate() -> Double? {
        
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
        
        operandStack = []
        operandStack.append("\(total)")
        println("stack = \(operandStack)")
        return total

    }
    
    
    func clear() {
        operandStack = []
    }
    
    func appendCurrentlyPressedPlusDisplay(digit: String) {
        operandStack.append("\(operandStack.removeLast())" + "\(digit)")
    }
    
    func operandStackCount() -> Int {
       return operandStack.count
    }

    
}