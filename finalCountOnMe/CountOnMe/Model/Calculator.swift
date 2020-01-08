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
    var lastThingAdded = ""
    var operationToReturn = ""
    
    
    // var expressionIsCorrect: Bool {
    //    return operation.last != "+" && operation.last != "-" && operation.last != "×" && operation.last != "÷"
    //}
    
    // var canAddOperator: Bool {
     //   return operation.last != "+" && operation.last != "-" && operation.last != "×" && operation.last != "÷"
   //}
    
    //var expressionHaveResult: Bool {
     //   return operation.contains("=")
    //}
    
    func forTrailingZero(result: Double) -> String {
        let finalResult = String(format: "%g", result)
        return finalResult
    }
    
    // fonction add number -> va ajouter  le nombre dans un tableau de nombres (numbers: [String]) [30]
    
    func addNumber(numberTapped: String) {
        currentNumber.append(numberTapped)
        print("currentNumber = \(currentNumber)")
    }
    
    // function add operator -> va ajouter les operators dans un tableau de operators (operators: [String]) []
    
    func addOperator(operatorTapped: String) {
        numbers.append(currentNumber)
        currentNumber.removeAll()
        operators.append(operatorTapped)
        print("operators = \(operators)")
    }
    
    
    func getTextToDisplay() -> String {
        // va me donner le texte a afficher dans le textview
    
        
        return operationToReturn
    }
    
    func calculate() {
        numbers.append(currentNumber)
        currentNumber.removeAll()
        print("numbers = \(numbers)")
        print("operators = \(operators)")
        
        let firstNumber = Int(numbers[0])!
        
        let firstOperator = operators[0]
        
        let secondNumber  = Int(numbers[1])!
        
        var calcul = 0
        
        while numbers.count > 1 {
        switch firstOperator {
        case "×": calcul = firstNumber * secondNumber
        case "÷": calcul =  firstNumber / secondNumber
        case "+": calcul = firstNumber + secondNumber
        case "-": calcul = firstNumber - secondNumber
        default:
            break
        }
        numbers.remove(at: 0)
        numbers.remove(at: 0)
        numbers.insert(String(calcul), at: 0)
        operators.remove(at: 0)
        
        print("numbers = \(numbers)")
        print("operators = \(operators)")
        }
    }
}

