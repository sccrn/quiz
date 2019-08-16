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
        setupTableView()
    }
    
    private func setupTableView() {
        HomeDataSource.setupHomeTableView(tableView: tableView)
        tableViewDataSource = HomeDataSource(viewModel: viewModel)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
    }
}
