//
//  CalculatorViewUITests.swift
//  WB_HomeWorkUITests
//
//  Created by Мария Изюменко on 11.08.2024.
//

import XCTest

final class CalculatorViewUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testAdditionOperation() {
        let textField = app.textFields["Enter number"]
        let plusButton = app.buttons["+"]
        let equalsButton = app.buttons["="]
        
        textField.tap()
        textField.typeText("5")
        plusButton.tap()
        textField.tap()
        textField.typeText("3")
        equalsButton.tap()
        
        let resultText = app.staticTexts.element(matching: .any, identifier: "result").label
        XCTAssertEqual(resultText, "8")
    }
    
    func testSubtractionOperation() {
        let textField = app.textFields["Enter number"]
        let minusButton = app.buttons["-"]
        let equalsButton = app.buttons["="]
        
        textField.tap()
        textField.typeText("9")
        minusButton.tap()
        textField.tap()
        textField.typeText("4")
        equalsButton.tap()
        
        let resultText = app.staticTexts.element(matching: .any, identifier: "result").label
        XCTAssertEqual(resultText, "5")
    }
    
    func testDivisionOperation() {
        let textField = app.textFields["Enter number"]
        let divisionButton = app.buttons["/"]
        let equalsButton = app.buttons["="]
        
        textField.tap()
        textField.typeText("10")
        divisionButton.tap()
        textField.tap()
        textField.typeText("5")
        equalsButton.tap()
        
        let resultText = app.staticTexts.element(matching: .any, identifier: "result").label
        XCTAssertEqual(resultText, "2")
    }
    
    func testMultiplyOperation() {
        let textField = app.textFields["Enter number"]
        let multiplyButton = app.buttons["*"]
        let equalsButton = app.buttons["="]
        
        textField.tap()
        textField.typeText("2")
        multiplyButton.tap()
        textField.tap()
        textField.typeText("3")
        equalsButton.tap()
        
        let resultText = app.staticTexts.element(matching: .any, identifier: "result").label
        XCTAssertEqual(resultText, "6")
    }
}
