//
//  HomeTableViewTest.swift
//  quizTests
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import XCTest
@testable import quiz

class HomeTableViewTest: XCTestCase {
    var dataSource: HomeDataSource!
    var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
        dataSource = HomeDataSource(viewModel: viewModel)
    }
    
    override func tearDown() {
        dataSource = nil
        viewModel = nil
        super.tearDown()
    }
    
    
    func testConfigure() {
        viewModel.allWords = ["test"]
        viewModel.insertWord(word: "test")
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.registerNib(cellClass: WordCell.self)
        let indexPath = IndexPath(row: 1, section: 0)
        
        guard let cell = dataSource.tableView(tableView, cellForRowAt: indexPath) as? WordCell else {
            XCTAssert(false, "Expected CurrencyCell class")
            return
        }
        XCTAssertEqual(cell.wordLabel.text, "test")
    }
}
