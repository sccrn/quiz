//
//  HomeControllerUITests.swift
//  quizUITests
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import XCTest

class HomeControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    func testHomeScreen() {
        app.launch()
        XCTAssertTrue(app.buttons["startResetButton"].label == "Start")
        XCTAssertTrue(app.textFields["insertWord"].exists)
        XCTAssertTrue(app.textFields["insertWord"].isEnabled == false)
        XCTAssertTrue(app.staticTexts["hits"].label == "00/50")
        XCTAssertTrue(app.staticTexts["timer"].label == "05:00")
        
        app.buttons["startResetButton"].tap()
        XCTAssertTrue(app.buttons["startResetButton"].label == "Reset")
        XCTAssertTrue(app.textFields["insertWord"].isEnabled == true)        
    }
}
