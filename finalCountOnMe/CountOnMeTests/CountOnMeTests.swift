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
        calculator.operation.append("10")
        calculator.operation.append("+")
        calculator.operation.append("2")

        let result = calculator.calculate()
        
        // Then
        XCTAssert(result == "12")
    }
    
    func testMultiplication() {
        // Given
        let calculator = Calculator()
        // When
        calculator.operation.append("10")
        calculator.operation.append("+")
        calculator.operation.append("2")
        
        let result = calculator.calculate()
        
        // Then
        XCTAssert(result == "12")
        
    }
    
    func testSubstraction() {
        // Given
        let calculator = Calculator()
        // When
        calculator.operation.append("10")
        calculator.operation.append("-")
        calculator.operation.append("8")
        
        let result = calculator.calculate()
        
        // Then
        XCTAssert(result == "2")
    }
    
    func testDivision() {
        // Given
        let calculator = Calculator()
        // When
        calculator.operation.append("10")
        calculator.operation.append("÷")
        calculator.operation.append("2")
        
        let result = calculator.calculate()
        
        // Then
        XCTAssert(result == "5")
    }
    
    func testOperatorAferResult() {
    //        Given
            let calculator = Calculator()
    //        When
            calculator.operation.append("1")
            calculator.operation.append("+")
            calculator.operation.append("2")
        let firstResult = calculator.calculate()!
            calculator.operation.removeAll()
            
            calculator.operation.append(firstResult)
            calculator.operation.append("+")
            calculator.operation.append("1")
            
           let result = calculator.calculate()
            
    //       then
            XCTAssert(result == "4")
        }
    
}

