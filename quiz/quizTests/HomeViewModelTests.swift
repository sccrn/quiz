//
//  HomeViewModelTests.swift
//  quizTests
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import XCTest
import Alamofire
@testable import quiz

class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    fileprivate var manager: MockHomeManager!
    
    override func setUp() {
        super.setUp()
        self.manager = MockHomeManager()
        self.viewModel = HomeViewModel(homeManager: manager)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.manager = nil
        super.tearDown()
    }
    
    func testFetchWithNoManager() {
        let expectation = XCTestExpectation(description: "Missing manager")
        
        viewModel.homeManager = nil
        
        viewModel.delegate?.didEndAction(with: .failed(error: expectation.description))
        if viewModel.homeManager == nil {
            expectation.fulfill()
        }
        viewModel.fetchQuiz()
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testFetchNoQuiz() {
        
        let expectation = XCTestExpectation(description: "No quiz")
        
        // giving a service mocking error during fetching currencies
        manager.quizModel = nil
        
        // expected completion to fail
        viewModel.delegate?.didEndAction(with: .failed(error: "no quiz"))
        if manager.quizModel == nil {
            expectation.fulfill()
        }
        
        viewModel.fetchQuiz()
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testInsertWord() {
        let word = ""
        viewModel.allWords = []
        viewModel.insertWord(word: word)
        XCTAssert(viewModel.insertedWords == [])
        
        let word2 = "test1"
        viewModel.allWords = ["test1", "test2"]
        viewModel.insertedWords = ["test"]
        viewModel.insertWord(word: word2)
        XCTAssert(viewModel.insertedWords == ["test", "test1"])
        XCTAssert(viewModel.clearText == true)
        
    }
    
    func testGetWord() {
        viewModel.insertedWords = ["test", "test2", "test6"]
        XCTAssertEqual(viewModel.getWordInArray(for: 1), "test2")
    }
    
    func testRestartQuiz() {
        viewModel.restartQuiz(enable: true)
        XCTAssertEqual(viewModel.isEnabled, true)
        XCTAssertEqual(viewModel.insertedWords, [])
        
        viewModel.restartQuiz(enable: false)
        XCTAssertEqual(viewModel.isEnabled, false)
        XCTAssertEqual(viewModel.insertedWords, [])
    }
    
    func testGetResult() {
        viewModel.insertedWords = ["1", "2", "3", "4"]
        XCTAssertEqual(viewModel.getResult(), "Sorry, time is up! You got 4 out of 50 answers.")
    }
}

fileprivate class MockHomeManager: HomeManagerProtocol {
    var quizModel: QuizModel?
    
    func fetchJavaChallenge(_ completion: @escaping (Result<QuizModel>) -> Void) {
        if let quizModel = quizModel {
            completion(Result.success(quizModel))
        }
    }
}
