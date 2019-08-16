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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HomeDataSource {
    class func setupHomeTableView(tableView: UITableView?) {
        
    }
}
