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
        if currentNumber != "" {
            numbers.append(currentNumber)
            currentNumber.removeAll()
        }
        
        operators.append(operatorTapped)
        print("operators = \(operators)")
    }
    
    
    func getTextToDisplay() -> String {
        // va me donner le texte a afficher dans le textview
        return operationToReturn
    }
    
    /**
     
     [4, 5, 6, 3, 4]
     [x, +, /, -]
     
     index mult : 0
     numbers[index mult] : 4
     numbers[index mult+1]: 5
     4 * 5 = 20
     remove a l'index : index mult (dans numbers)
     et encore : index mult (dans numbers)
     remove a l'index : index mult (dans operators)
     
     [ 6, 3, 4]
     [ +, /, -]
     
     
     ajout resultat a l'index :index mult (dans numbers)
     
     [20, 6, 3, 4]
     [ +, /, -]
     
     6 / 3 = 2
     
     [20, 4]
     [ +, -]
     
     [22, 4]
     [ -]
     
     [18]]
     
     
     
     - je cherche ou se trouve la premiere multiplication ou la division dans operators (si y a pas d'index y a pas de priorité de calcul, donc je fais comme avant)
     - je trouve l'index de l'operateur trouvé
     - Grace à l'index je dois trouver les chiffres qui vont créer l'operation exemple : je trouve le x a l'index 1 de mon operators, je vais après chercher le nombre qui se trouve a l'index 1 de numbers(3) (au meme index dans numbers que l'operateur dans operators)
     - Puis je recupere le nombre qui se trouve à l'index suivant dans numbers (2)
     - J'obtiens donc l'operation 3 x 2
     - Ensuite, je calcul, j'obtiens 6
     - Je remoove a l'index 1 et 1 les nombres dans numbers, et à l'index 1 dans operators.
     - Puis j'ajoute le resultat à numbers à l'index 1
     */
    func calculate() {
        numbers.append(currentNumber)
        currentNumber.removeAll()
        print("numbers = \(numbers)")
        print("operators = \(operators)")
        
        while numbers.count > 1 {
            // ça commence ici
            let indexPrio = 0 // - je cherche ou se trouve la premiere multiplication ou la division dans operators (si y a pas d'index y a pas de priorité de calcul, donc je fais comme avant)
            operators.firstIndex(of: "×")
            
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
            
            print("numbers = \(numbers)")
            print("operators = \(operators)")
        }
    }
}

