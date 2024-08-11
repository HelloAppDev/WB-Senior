//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Мария Изюменко on 11.08.2024.
//

import XCTest
@testable import WB_HomeWork

class CalculatorTests: XCTestCase {
    
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    override func tearDown() {
        calculator = nil
        super.tearDown()
    }
    
    func testAddition() {
        let result = calculator.add(3, 2)
        XCTAssertEqual(result, 5)
    }
    
    func testSubtraction() {
        let result = calculator.subtract(5, 3)
        XCTAssertEqual(result, 2)
    }
    
    func testMultiplication() {
        let result = calculator.multiply(3, 4)
        XCTAssertEqual(result, 12)
    }
    
    func testDivision() {
        let result = calculator.divide(8, 2)
        XCTAssertEqual(result, 4)
    }
    
    func testDivisionByZero() {
        let result = calculator.divide(8, 0)
        XCTAssertTrue(result.isInfinite)
    }
}
