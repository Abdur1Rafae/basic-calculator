//
//  KalculatorTests.swift
//  KalculatorTests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest
@testable import Kalculator

final class KalculatorTests: XCTestCase {
    
    private var calculator: Calculator!
    private var vC: ViewController!
    
    //MARK: CALCULATOR
    // MARK: Set Up & Teardown function
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculator = Calculator()
        
        super.setUp()
        vC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as! ViewController
        
        UIApplication.shared.keyWindow?.rootViewController = vC
        _ = vC.view
    }

    override func tearDownWithError() throws {
        calculator = nil
        vC = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: Positive(P) and Negative(N) cases for Appending digit and opperation
    
    //positive test for checking input
    func test_P_AppendAndOpp() {
        var op: CalculatorOperation
        
        op = .add
        XCTAssertEqual(try calculator.inputDigit(op.rawValue), "0")
        
        op = .subtract
        XCTAssertEqual(try calculator.inputDigit(op.rawValue), "0")
        
        op = .multiply
        XCTAssertEqual(try calculator.inputDigit(op.rawValue), "0")
        
        op = .divide
        XCTAssertEqual(try calculator.inputDigit(op.rawValue), "0")
        
        var test_digit = "23"
        XCTAssertEqual(try calculator.inputDigit(test_digit), "23")
        
        test_digit = "45"
        XCTAssertEqual(try calculator.inputDigit(test_digit), "2345")
    }
    
    func test_N_Opp() {
        XCTAssertThrowsError(try calculator.inputDigit("add"))
        XCTAssertThrowsError(try calculator.inputDigit("subtract"))
        XCTAssertThrowsError(try calculator.inputDigit("multiply"))
        XCTAssertThrowsError(try calculator.inputDigit("divide"))
        XCTAssertThrowsError(try calculator.inputDigit("Random Words"))
    }
    
    func test_N_appendDigit() {
        XCTAssertThrowsError(try calculator.appendDigit("A"))
        XCTAssertThrowsError(try calculator.appendDigit("@"))
        XCTAssertThrowsError(try calculator.appendDigit("+"))
    }
    
    //MARK: Positive(P) and Negative(N) case for adding
    
    func test_P_addOpperation() throws {
        let num1 = 4
        let num2 = 2
        var op = CalculatorOperation.add
        
        try calculator.inputDigit("\(num1)")
        try calculator.inputDigit(op.rawValue)
        try calculator.inputDigit("\(num2)")
        
        op = .equals
        
        XCTAssertEqual(try calculator.inputDigit(op.rawValue), "6")
    }
    
    func test_N_addOpperation() throws {
        let num1 = 4
        let num2 = 2
        var op = CalculatorOperation.add
        
        try calculator.inputDigit("\(num1)")
        try calculator.inputDigit(op.rawValue)
        try calculator.inputDigit("\(num2)")
        
        op = .equals
        
        XCTAssertNotEqual(try calculator.inputDigit(op.rawValue), "5")
        
    }
    
    //MARK: Positive(P) and Negative(N) case for subtracting
    
    func test_P_subtractOperation() throws {
        let num1 = 4
        let num2 = 2
        var op = CalculatorOperation.subtract
        
        try calculator.inputDigit("\(num1)")
        try calculator.inputDigit(op.rawValue)
        try calculator.inputDigit("\(num2)")
        
        op = .equals
        
        XCTAssertEqual(try calculator.inputDigit(op.rawValue), "2")
    }
    
    func test_N_subtractOperation() throws {
        let num1 = 4
        let num2 = 2
        var op = CalculatorOperation.subtract
        
        try calculator.inputDigit("\(num1)")
        try calculator.inputDigit(op.rawValue)
        try calculator.inputDigit("\(num2)")
        
        op = .equals
        
        XCTAssertNotEqual(try calculator.inputDigit(op.rawValue), "3")
    }
    
    //MARK: Positive(P) and Negative(N) case for multiplication
    
    func test_P_multiplyOperation() throws {
        let num1 = 4
        let num2 = 2
        var op = CalculatorOperation.multiply
        
        try calculator.inputDigit("\(num1)")
        try calculator.inputDigit(op.rawValue)
        try calculator.inputDigit("\(num2)")
        
        op = .equals
        
        XCTAssertEqual(try calculator.inputDigit(op.rawValue), "8")
    }
    
    func test_N_multiplyOperation() throws {
        let num1 = 4
        let num2 = 2
        var op = CalculatorOperation.multiply
        
        try calculator.inputDigit("\(num1)")
        try calculator.inputDigit(op.rawValue)
        try calculator.inputDigit("\(num2)")
        
        op = .equals
        
        XCTAssertNotEqual(try calculator.inputDigit(op.rawValue), "9")
    }
    
    //MARK: Positive(P) and Negative(N) cases for Dividing
    
    func test_P_divideOpperation() throws {
        let num1 = 4
        let num2 = 2
        var op = CalculatorOperation.divide
        
        try calculator.inputDigit("\(num1)")
        try calculator.inputDigit(op.rawValue)
        try calculator.inputDigit("\(num2)")
        
        op = .equals
        
        XCTAssertEqual(try calculator.inputDigit(op.rawValue), "2")
    }
    
    func test_N_divideOpperationWrongCal() throws {
        let num1 = 4
        let num2 = 2
        var op = CalculatorOperation.divide
        
        try calculator.inputDigit("\(num1)")
        try calculator.inputDigit(op.rawValue)
        try calculator.inputDigit("\(num2)")
        
        op = .equals
        
        XCTAssertNotEqual(try calculator.inputDigit(op.rawValue), "1")
    }
    
    func test_N_divideOperationGivesError() throws {
        let num1 = 45
        let num2 = 0
        var op = CalculatorOperation.divide
        
        try calculator.inputDigit("\(num1)")
        try calculator.inputDigit(op.rawValue)
        try calculator.inputDigit("\(num2)")
        
        op = .equals
        
        XCTAssertThrowsError(try calculator.inputDigit(op.rawValue))
    }
    
    //MARK: Positive(P) and Negative(N) case for clearing function
    
    func test_P_clear() throws {
        try calculator.inputDigit("3")
        calculator.clear()
        let value = "2"
        XCTAssertEqual(try calculator.inputDigit(value), value)
    }
    
    func test_N_clear() throws {
        let actual_value = "3"
        calculator.clear()
        let value = "2"
        XCTAssertNotEqual(try calculator.inputDigit(actual_value), value)
    }
    
    //MARK: VIEWCONTROLLER
    
    //MARK: True(T) and false(F) Cases ViewController Input
    
    func test_T_VC_InputDigit() {
        let inputNumber = "1"
        let inputButton = UIButton(type: .custom)
        inputButton.setTitle(inputNumber, for: .normal)
        
        vC.inputDigit(inputButton)
        
        XCTAssertEqual(vC.resultScreen.text, inputNumber)
    }
    
    func test_F_VC_InputDigit() {
        let inputNumber = "1"
        let inputButton = UIButton(type: .custom)
        inputButton.setTitle(inputNumber, for: .normal)
        
        vC.inputDigit(inputButton)
        
        XCTAssertNotEqual(vC.resultScreen.text, "0")
    }
    
    //MARK: True(T) and False(F) Case for ViewController Clearing button
    
    func test_T_VC_clear() {
        let inputNumber = "1"
        let inputButton = UIButton(type: .custom)
        inputButton.setTitle(inputNumber, for: .normal)
        
        vC.inputDigit(inputButton)
        
        vC.clear("")
        XCTAssertEqual(vC.resultScreen.text, "0")
    }
    
    func test_F_VC_clear() {
        let inputNumber = "1"
        let inputButton = UIButton(type: .custom)
        inputButton.setTitle(inputNumber, for: .normal)
        
        vC.inputDigit(inputButton)
        
        vC.clear("")
        XCTAssertNotEqual(vC.resultScreen.text, "1")
    }
}
