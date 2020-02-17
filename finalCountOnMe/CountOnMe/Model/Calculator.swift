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
    
    func clearNumbersAndOperators() {
        numbers.removeAll()
        operationToReturn.removeAll()
    }
    
    // fonction add number -> va ajouter  le nombre dans un tableau de nombres (numbers: [String]) [30]
    
    func addNumber(numberTapped: String) {
        
        if numbers.count > 0 && operators.count == 0 {
            // la personne a fait un calcul et re-click sur un nombre pour en effecturer un nouveau.
            // Nous on veut : tout remove pour que ce soit clean pour le nouveau calcul
            clearNumbersAndOperators()
        }
        
        currentNumber.append(numberTapped)
        operationToReturn.append(numberTapped)
        print("OpToReturn\(operationToReturn)")
        print("currentNumber = \(currentNumber)")
        
    }
    
    // function add operator -> va ajouter les operators dans un tableau de operators (operators: [String]) []
    
    func addOperator(operatorTapped: String) {
        if currentNumber != "" {
            numbers.append(currentNumber)
            currentNumber.removeAll()
        }
        
        operators.append(operatorTapped)
        operationToReturn.append(operatorTapped)
        print("OpToReturn\(operationToReturn)")
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
        
        while numbers.count > 1 {
            // ça commence ici
            
            let indexPrio = operators.firstIndex(of: "×") ?? operators.firstIndex(of: "÷") ?? 0
            // - je cherche ou se trouve la premiere multiplication ou la division dans operators (si y a pas d'index y a pas de priorité de calcul, donc je fais comme avant)
            
            let firstNumber = Int(numbers[indexPrio])!
            let firstOperator = operators[indexPrio]
            let secondNumber  = Int(numbers[indexPrio + 1])!
            var calcul = 0
            
            switch firstOperator {
            case "×": calcul = firstNumber * secondNumber
            case "÷": calcul = firstNumber / secondNumber
            case "+": calcul = firstNumber + secondNumber
            case "-": calcul = firstNumber - secondNumber
            default:
                break
            }
            
            numbers.remove(at: indexPrio)
            numbers.remove(at: indexPrio)
            numbers.insert(String(calcul), at: indexPrio)
            operators.remove(at: indexPrio)
            operationToReturn.removeAll()
            operationToReturn.append(String(calcul))
            print("numbers = \(numbers)")
            print("operators = \(operators)")
        }
    }
}

