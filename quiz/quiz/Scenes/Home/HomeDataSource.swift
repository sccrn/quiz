//
//  HomeDataSource.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation
import UIKit

class HomeDataSource: NSObject {
    private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

extension HomeDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.typeOfCell(for: indexPath.row) {
        case .textField:
            let cell = tableView.dequeue(cellClass: TextFieldCell.self, indexPath: indexPath)
            cell.configure(question: viewModel.question, clearText: viewModel.clearText, delegate: self)
            return cell
        case .word:
            let cell = tableView.dequeue(cellClass: WordCell.self, indexPath: indexPath)
            return cell
        }
    }
}

extension HomeDataSource {
    class func setupHomeTableView(tableView: UITableView?) {
        tableView?.registerNib(cellClass: TextFieldCell.self)
        tableView?.registerNib(cellClass: WordCell.self)
    }
}

extension HomeDataSource: TextFieldCellDelegate {
    func didChangeWord(word: String) {
        viewModel.insertWord(word: word)
    }
}
