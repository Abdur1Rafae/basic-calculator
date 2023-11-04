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
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //positive test for checking input
    func test_P_input() {
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
    
    func test_P_clear() {
        calculator.clear()
        let value = "2"
        XCTAssertEqual(try calculator.inputDigit(value), value)
    }
    
    func test_N_inputOperaton() {
        XCTAssertThrowsError(try calculator.inputDigit("add"))
        XCTAssertThrowsError(try calculator.inputDigit("subtract"))
        XCTAssertThrowsError(try calculator.inputDigit("multiply"))
        XCTAssertThrowsError(try calculator.inputDigit("divide"))
    }
    
    func test_N_appendDigit() {
        XCTAssertThrowsError(try calculator.appendDigit("A"))
        XCTAssertThrowsError(try calculator.appendDigit("@"))
        XCTAssertThrowsError(try calculator.appendDigit("+"))
    }
    
    func test_N_divideOperation() throws {
        let num1 = 45
        let num2 = 0
        var op = CalculatorOperation.divide
        
        try calculator.inputDigit("\(num1)")
        try calculator.inputDigit(op.rawValue)
        try calculator.inputDigit("\(num2)")
        
        op = .equals
        
        XCTAssertThrowsError(try calculator.inputDigit(op.rawValue))
    }
    
    func test_T_VC_InputDigit() {
        let inputNumber = "1"
        let inputButton = UIButton(type: .custom)
        inputButton.setTitle(inputNumber, for: .normal)
        
        vC.inputDigit(inputButton)
        
        XCTAssertEqual(vC.resultScreen.text, inputNumber)
    }
    
    func test_T_VC_clear() {
        vC.clear("")
        XCTAssertEqual(vC.resultScreen.text, "0")
    }
    

    func testExample() throws {
        XCTAssert(true)
    }
}
