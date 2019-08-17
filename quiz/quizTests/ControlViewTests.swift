//
//  ControlViewTests.swift
//  quizTests
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import XCTest
@testable import quiz

class ControlViewTests: XCTestCase {
    var controlView: ControlView!
    
    override func setUp() {
        super.setUp()
        self.controlView = ControlView()
    }
    
    override func tearDown() {
        self.controlView = nil
        super.tearDown()
    }
    
    func testConfigure() {
        controlView.configureLayout()
        XCTAssertEqual(controlView.startResetButton.titleLabel?.text, "Start")
        XCTAssertEqual(controlView.numberOfHits.text, "00/50")
        XCTAssertEqual(controlView.timerLabel.text, "05:00")
    }
    
    func testInsertNewWord() {
        controlView.insertNewWord(count: 3)
        XCTAssertEqual(controlView.numberOfHits.text, "03/50")
        
        controlView.insertNewWord(count: 23)
        XCTAssertEqual(controlView.numberOfHits.text, "23/50")
    }
}
