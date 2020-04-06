//
//  Calculator.swift
//  CountOnMe
//
//  Created by Florian Peyrony on 19/05/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    
    var operators = [String]()
    var numbers = [String]()
    var currentNumber = ""
    var operationToReturn = ""
    
    // we check if the user has written the correct operation when he presses the equal button, before run the calculate function
    var expressionIsCorrect: Bool {
        if numbers.count == operators.count && currentNumber != "" {
            return true
        } else {
            return false
        }
    }
    
    // we check if the user don't tap on operator button if there is also an operator tapped before
    var canAddOperator: Bool {
        if operators.count < numbers.count + ((currentNumber == "") ? 0 : 1) {
            return true
        } else {
            return false
        }
    }
    
    func forTrailingZero(result: Double) -> String {
        let finalResult = String(format: "%g", result)
        return finalResult
    }
    
    func clearAll() {
        numbers.removeAll()
        operationToReturn.removeAll()
        operators.removeAll()
        currentNumber.removeAll()
    }
    
    func addNumber(numberTapped: String) {
        if numbers.count > 0 && operators.count == 0 {
            clearAll()
        }
        
        currentNumber.append(numberTapped)
        operationToReturn.append(numberTapped)
    }
    
    func addOperator(operatorTapped: String) {
        if currentNumber != "" {
            numbers.append(currentNumber)
            currentNumber.removeAll()
        }
        
        operators.append(operatorTapped)
        operationToReturn.append(operatorTapped)
    }
    
    func getTextToDisplay() -> String {
        return operationToReturn
    }
    
    func calculate() {
        numbers.append(currentNumber)
        currentNumber.removeAll()
        
        while numbers.count > 1 {
            var indexPrio = 0
            let indexOfMulti = operators.firstIndex(of: "×")
            let indexOfDivision = operators.firstIndex(of: "÷")
            
            if indexOfMulti == nil {
                indexPrio = indexOfDivision ?? 0
            } else if indexOfDivision == nil {
                indexPrio = indexOfMulti ?? 0
            } else {
                if indexOfMulti ?? Int.max < indexOfDivision ?? Int.max {
                    indexPrio = indexOfMulti ?? 0
                } else {
                    indexPrio = indexOfDivision ?? 0
                }
            }

            let firstNumber = Double(numbers[indexPrio])!
            let firstOperator = operators[indexPrio]
            let secondNumber  = Double(numbers[indexPrio + 1])!
            var calcul = 0.0
            
            switch firstOperator {
            case "×": calcul = firstNumber * secondNumber
            case "÷": calcul = firstNumber / secondNumber
            case "+": calcul = firstNumber + secondNumber
            case "-": calcul = firstNumber - secondNumber
            default:
                break
            }
            
            // after calculate, we got the result so we remove the 2 numbers we use for the calculation and we insert the new result of the operation at the same index
            numbers.remove(at: indexPrio)
            numbers.remove(at: indexPrio)
            numbers.insert(String(calcul), at: indexPrio)
            
            // we also remove the operator we use for calculation
            operators.remove(at: indexPrio)
            
            // we remove the operationToReturn for the new calculation, and we trail the result because we work with double
            operationToReturn.removeAll()
            operationToReturn.append(forTrailingZero(result: calcul))
        }
    }
}

