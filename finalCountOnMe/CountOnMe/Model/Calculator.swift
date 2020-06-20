//
//  Calculator.swift
//  CountOnMe
//
//  Created by Florian Peyrony on 19/05/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

/** Model of the app, calculs are make here */
class Calculator {
    
    // MARK: - Propreties
    
    /** An array where we got all the operators of the current calcul */
    var operators = [String]()
    
    /** An array we use to put all the numbers the user choosen for current calcul */
    var numbers = [String]()
    
    /** when we choose a number, until we press operator button, the number is stock in currentNumber, and when user press operator Button, the number in current number goes to numbers */
    var currentNumber = ""
    
    /** The operation to display to the user */
    var operationToReturn = ""
    
    /** we check if the user has written the correct operation when he presses the equal button, before run the calculate function */
    var expressionIsCorrect: Bool {
        if numbers.count == operators.count && currentNumber != "" {
            return true
        } else {
            return false
        }
    }
    
    /** we check if the user tap on operator button if there is also an operator tapped before */
    var canAddOperator: Bool {
        if operators.count < numbers.count + ((currentNumber == "") ? 0 : 1) {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Functions
    
    /** this func clear all if there is a new calcul after result, and add the current number in Numbers, and update opertionToReturn to display to the user
     - parameter numberTapped: A string representing the number to add
     */
    func addNumber(numberTapped: String) {
        if numbers.count > 0 && operators.count == 0 {
            clearAll()
        }   
        
        currentNumber.append(numberTapped)
        operationToReturn.append(numberTapped)
    }
    
    /**
     Add the given operator in the operator list
     - parameter operatorTapped: A String representing the operator to add
     */
    func addOperator(operatorTapped: String) {
        if currentNumber != "" {
            numbers.append(currentNumber)
            currentNumber.removeAll()
        }
        
        operators.append(operatorTapped)
        operationToReturn.append(operatorTapped)
    }
    
    /** This function clear all the data we got in calculator */
    func clearAll() {
        numbers.removeAll()
        operationToReturn.removeAll()
        operators.removeAll()
        currentNumber.removeAll()
    }
    
    /**
     Return the text to display in the ViewController
     - return operationToReturn: A String representing the current calcul as text.
     */
    func getTextToDisplay() -> String {
        return operationToReturn
    }

    /**
     Return the result, and trailed the result because we work with double.
     - parameter result: A string reprenting the result to trailed.
     - return finalResult: A string who representing the trailedResult.
     */
    func forTrailingZero(result: Double) -> String {
        let finalResult = String(format: "%g", result)
        return finalResult
    }
    
    /** Calculate the current calcul and fill operationToReturn */
    func calculate() {
        numbers.append(currentNumber)
        currentNumber.removeAll()
        
        while numbers.count > 1 {
            var indexPrio = 0
            let indexOfMulti = operators.firstIndex(of: "×")
            let indexOfDivision = operators.firstIndex(of: "÷")
            
            /** This is for priority of calculs if we got no x, we use index of % or zero, else if indexOfDiv = nil, we use indexOfMult or zero, and if wee got indexOfMult and indexOfDiv, we use the first one because there is no priority */
            if indexOfMulti == nil {
                indexPrio = indexOfDivision ?? 0
            } else if indexOfDivision == nil {
                indexPrio = indexOfMulti ?? 0
            } else {
                if indexOfMulti! < indexOfDivision! {
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

