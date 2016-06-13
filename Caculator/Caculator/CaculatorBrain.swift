//
//  CaculatorBrain.swift
//  Caculator
//
//  Created by 👫 on 16/6/12.
//  Copyright © 2016年 刘健. All rights reserved.
//

import Foundation

func multiply(opt1:Double, opt2:Double) -> Double {
    return opt1 * opt2
}

class CaculatorBrain
{

    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
    
        accumulator = operand
        
    }
    
    var operations : Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" :Operation.UnaryOperation(cos),
        "×" :Operation.BinaryOperation(multiply),
        "=" :Operation.Equals
    ]
    
    
    func performOperand(symbol: String) {
        
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let foo): accumulator = foo(accumulator)
            case.BinaryOperation: break
            case.Equals: break
            }
        }
        
    }
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    var result: Double {
        get{
            return accumulator
        }
    }
    
    
}
