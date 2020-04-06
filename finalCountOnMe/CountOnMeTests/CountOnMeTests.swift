//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Florian Peyrony on 20/08/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//
import XCTest
@testable import CountOnMe

class CalculateTestCase: XCTestCase {
    
    func testAddititon() {
        // Given
        let calculator = Calculator()
        // When
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "+")
        calculator.addNumber(numberTapped: "2")
        
        calculator.calculate()
        
        // Then
        XCTAssert(calculator.operationToReturn == "12")
    }
    
    func testMultiplication() {
        // Given
        let calculator = Calculator()
        // When
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "×")
        calculator.addNumber(numberTapped: "2")
        
        calculator.calculate()
        
        // Then
        XCTAssert(calculator.operationToReturn == "20")
    }
    
    func testSubstraction() {
        // Given
        let calculator = Calculator()
        // When
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "-")
        calculator.addNumber(numberTapped: "2")
        
        XCTAssert(calculator.expressionIsCorrect == true)
        
        calculator.calculate()
        
        // Then
        XCTAssert(calculator.operationToReturn == "8")
    }
    
    func testDivision() {
        // Given
        let calculator = Calculator()
        // When
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "÷")
        calculator.addNumber(numberTapped: "2")
        
        calculator.calculate()
        
        // Then
        XCTAssert(calculator.operationToReturn == "5")
    }
    
    func testPriority() {
        // Given
        let calculator = Calculator()
        // When
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "×")
        calculator.addNumber(numberTapped: "2")
        calculator.addOperator(operatorTapped: "÷")
        calculator.addNumber(numberTapped: "2")
        calculator.calculate()
        
        // Then
        XCTAssert(calculator.operationToReturn == "10")
    }
    
    func testPriority2() {
        // Given
        let calculator = Calculator()
        // When
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "÷")
        calculator.addNumber(numberTapped: "2")
        calculator.addOperator(operatorTapped: "×")
        calculator.addNumber(numberTapped: "2")
        calculator.calculate()
        
        // Then
        XCTAssert(calculator.operationToReturn == "10")
    }
    
    func testOperatorAferResult() {
        // Given
        let calculator = Calculator()
        // When
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "÷")
        calculator.addNumber(numberTapped: "2")
        
        calculator.calculate()
        
        calculator.addOperator(operatorTapped: "+")
        calculator.addNumber(numberTapped: "5")
        
        calculator.calculate()
    
        XCTAssert(calculator.operationToReturn == "10")
    }
    
    func testNumberAferResult() {
        // Given
        let calculator = Calculator()
        // When
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "÷")
        calculator.addNumber(numberTapped: "2")
        calculator.calculate()
      
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "÷")
        calculator.addNumber(numberTapped: "2")
        calculator.calculate()
        
        XCTAssert(calculator.operationToReturn == "5")
    }
       
    
    func testErrorDoubleOperator() {
        let calculator = Calculator()
        
        calculator.addNumber(numberTapped: "10")
        
        XCTAssertTrue(calculator.canAddOperator)
        
        calculator.addOperator(operatorTapped: "+")
        
        XCTAssert(calculator.canAddOperator == false)
        
        
    }
    
    func testExpressionIsCorrect() {
        let calculator = Calculator()
        
        XCTAssert(calculator.expressionIsCorrect == false)
        
        calculator.addNumber(numberTapped: "10")
        
        XCTAssert(calculator.expressionIsCorrect == true)
        
        calculator.addOperator(operatorTapped: "+")
        
        XCTAssert(calculator.expressionIsCorrect == false)
        
        calculator.addNumber(numberTapped: "3")
        
        XCTAssert(calculator.expressionIsCorrect == true)
        
        calculator.calculate()
        
        XCTAssert(calculator.expressionIsCorrect == false)
    }
    
    func testTextToDisplay() {
        // Given
        let calculator = Calculator()
        // When
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "÷")
        calculator.addNumber(numberTapped: "2")
        
        calculator.calculate()
        
        // Then
        XCTAssert(calculator.getTextToDisplay() == "5")
    }
    
    func testClearAll() {
        // Given
        let calculator = Calculator()
        // When
        calculator.addNumber(numberTapped: "10")
        calculator.addOperator(operatorTapped: "÷")
        calculator.addNumber(numberTapped: "2")
        calculator.calculate()
        calculator.clearAll()
        

        XCTAssert(calculator.numbers.count == 0)
        XCTAssert(calculator.operationToReturn == "")
        XCTAssert(calculator.currentNumber == "")
        XCTAssert(calculator.operators.count == 0)

    }
    
}

