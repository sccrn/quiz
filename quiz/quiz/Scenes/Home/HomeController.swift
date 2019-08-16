//
//  HomeController.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import UIKit

class HomeController: BaseController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var controlView: ControlView!
    
    
    private var viewModel: HomeViewModel
    private var tableViewDataSource: HomeDataSource?
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        loadLayout()
        setupTableView()
    }

    private func loadLayout() {
        controlView.delegate = self
        navigationController?.setNavigationBarHidden(true, animated: false)
        viewModel.delegate = self
        showLoading()
        viewModel.fetchQuiz()
    }
    
    private func setupTableView() {
        HomeDataSource.setupHomeTableView(tableView: tableView)
        tableViewDataSource = HomeDataSource(viewModel: viewModel)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
    }
    
    private func showAlert(message: String, isSuccess: Bool) {
        let title = isSuccess ? Constants.Titles.congratulations : Constants.Titles.timeFinished
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let actionTitle = isSuccess ? Constants.Titles.playAgain : Constants.Titles.tryAgain
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (_) in
            self.controlView.configureLayout()
            self.viewModel.restartQuiz()
            self.tableView.reloadData()
        }))
        present(alert, animated: true)
    }
}

extension HomeController: HomeDelegate {
    func didEndAction(with state: HomeState) {
        switch state {
        case .success:
            stopLoading()
            tableView.reloadData()
        case .insertedNewWord:
            controlView.insertNewWord(count: viewModel.insertedWords.count)
            tableView.reloadData()
        case .failed(let error):
            stopLoading()
            showError(message: error)
        }
    }
}

extension HomeController: ControlViewDelegate {
    func didChange(with action: ControlViewState) {
        switch action {
        case .allWords:
            showAlert(message: Constants.Messages.congratsMessage, isSuccess: true)
        case .textState(let enable):
            viewModel.isEnabled = enable
            tableView.reloadData()
        case .endTimer:
            let message = viewModel.getResult()
            showAlert(message: message, isSuccess: false)
        }
    }
}
