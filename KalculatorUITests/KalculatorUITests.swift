//
//  KalculatorUITests.swift
//  KalculatorUITests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest

final class KalculatorUITests: XCTestCase {

    private var app : XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // UI tests must launch the application that they test.
        app = XCUIApplication()
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testExample() throws {
        
        // Get all the buttons
        if let buttons = app?.buttons{
            XCTAssert(true)
        }
    }
    
    func testButtonsPresence() {
        XCTAssertTrue(app.buttons["0"].exists)
        XCTAssertTrue(app.buttons["1"].exists)
        XCTAssertTrue(app.buttons["2"].exists)
        XCTAssertTrue(app.buttons["3"].exists)
        XCTAssertTrue(app.buttons["4"].exists)
        XCTAssertTrue(app.buttons["5"].exists)
        XCTAssertTrue(app.buttons["6"].exists)
        XCTAssertTrue(app.buttons["7"].exists)
        XCTAssertTrue(app.buttons["8"].exists)
        XCTAssertTrue(app.buttons["9"].exists)
        
        XCTAssertTrue(app.buttons["/"].exists)
        XCTAssertTrue(app.buttons["*"].exists)
        XCTAssertTrue(app.buttons["+"].exists)
        XCTAssertTrue(app.buttons["-"].exists)
        XCTAssertTrue(app.buttons["="].exists)
        
        XCTAssertTrue(app.buttons["C"].exists)
    }
    
    func testBasicOutputDisplay() {
        app.buttons["1"].tap()
        XCTAssertEqual(app.staticTexts["Display"].label, "1")
        app.buttons["2"].tap()
        XCTAssertEqual(app.staticTexts["Display"].label, "12")
        app.buttons["3"].tap()
        XCTAssertEqual(app.staticTexts["Display"].label, "123")
        
        app.buttons["C"].tap()
        XCTAssertEqual(app.staticTexts["Display"].label, "0")
        
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        XCTAssertEqual(app.staticTexts["Display"].label, "56")
        
        app.buttons["C"].tap()
        
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["0"].tap()
        XCTAssertEqual(app.staticTexts["Display"].label, "7890")
    }
    
    func testComputedOutputDisplay() {
        //6 / 2 * 5 + 10 - 30
        app.buttons["6"].tap()
        app.buttons["/"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Display"].label, "3")
        
        app.buttons["*"].tap()
        app.buttons["5"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Display"].label, "15")
        
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Display"].label, "25")
        
        app.buttons["-"].tap()
        app.buttons["3"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Display"].label, "-5")
    }
    
    func testErrorsDisplay() {
        app.buttons["6"].tap()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Display"].label, "Err")
        
        //checking if input coorectly gets appended after error display
        app.buttons["2"].tap()
        XCTAssertEqual(app.staticTexts["Display"].label, "2")
    }

}
