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
    var number = ""
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
        numbers.append(numberTapped)
        print("numbers\(numbers)")
    }
    
    // function add operator -> va ajouter les operators dans un tableau de operators (operators: [String]) []
    
    func addOperator(operatorTapped: String) {
        operators.append(operatorTapped)
        print("operators\(operators)")
    }
    
    func tappedEqualButton() {
        numbers.append(number)
        print("numbers\(numbers)")
    }
    
    func getTextToDisplay() -> String {
        // va me donner le texte a afficher dans le textview
    
        
        return operationToReturn
    }
    
    func calculate() -> String? {
        return ""
    }
}

