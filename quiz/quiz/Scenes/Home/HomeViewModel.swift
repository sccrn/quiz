//
//  HomeViewModel.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

enum HomeState {
    case success
    case insertedNewWord
    case failed(error: String)
}

enum HomeTVCell {
    case textField, word
}

protocol HomeDelegate: class {
    func didEndAction(with state: HomeState)
}

import Foundation

class HomeViewModel {
    private var homeManager: HomeManager
    var insertedWords: [String] = []
    private var tableViewList: [HomeTVCell] = []
    private var allWords: [String] = []
    
    var isEnabled: Bool = false
    var clearText: Bool = false
    var question: String = ""
    weak var delegate: HomeDelegate?
    
    init(homeManager: HomeManager) {
        self.homeManager = homeManager
    }
    
    func fetchQuiz() {
        homeManager.fetchJavaChallenge { [weak self] result in
            switch result {
            case .success(let quiz):
                self?.question = quiz.question
                self?.allWords = quiz.answer
                
                self?.updateTableView()
                self?.delegate?.didEndAction(with: .success)
            case .failure(let error):
                self?.delegate?.didEndAction(with: .failed(error: error.localizedDescription))
            }
        }
    }
    
    func insertWord(word: String) {
        if allWords.contains(word) && !insertedWords.contains(word) {
            clearText = true
            insertedWords.append(word)
            updateTableView()
            delegate?.didEndAction(with: .insertedNewWord)
        }
    }
    
    func getResult() -> String {
        return "\(Constants.Messages.timeFiniMessageOne)\(insertedWords.count)\(Constants.Messages.timeFiniMessageTwo)"
    }
    
    func restartQuiz() {
        isEnabled = false
        insertedWords = []
        updateTableView()
    }
}

extension HomeViewModel {
    private func updateTableView() {
        tableViewList.removeAll()
        tableViewList.append(.textField)
        tableViewList.append(contentsOf: repeatElement(.word, count: insertedWords.count))
    }
    
    func numberOfRows() -> Int {
        return tableViewList.count
    }
    
    func typeOfCell(for row: Int) -> HomeTVCell {
        return tableViewList[row]
    }
    
    func getWordInArray(for row: Int) -> String {
        return insertedWords[row]
    }
}
