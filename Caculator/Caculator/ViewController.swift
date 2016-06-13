//
//  ViewController.swift
//  Caculator
//
//  Created by 👫 on 16/6/11.
//  Copyright © 2016年 刘健. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        
        if userIsInTheMiddleOfTyping {
            let textCurrentInDisplay = display.text!
            display.text = textCurrentInDisplay + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    private var displayValue:Double {
        get{
            
            return Double(display.text!)!
            
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CaculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathSymbol = sender.currentTitle{
          
            brain.performOperand(mathSymbol)
            
        }
        displayValue = brain.result
    }
    
}

