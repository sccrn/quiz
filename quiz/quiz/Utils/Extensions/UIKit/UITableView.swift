//
//  UITableView.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    
    ///Register a cell with his default name and identifier on the main bundle. You MUST have created the corresponding nib.
    func registerNib<T: UITableViewCell>(cellClass: T.Type) {
        self.register(UINib(nibName: T.defaultIdentifier, bundle: Bundle.main),
                      forCellReuseIdentifier: T.defaultIdentifier)
    }
    
    ///Register a cell with his default Class Name. Ex: CustomCell.self
    private func registerCell<T: UITableViewCell>(cellClass: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.defaultIdentifier)
    }
    
    ///Dequeue a cell with his default Class Name. Ex: CustomCell.self
    func dequeue<T: UITableViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T {
        return self.dequeue(withIdentifier: cellClass.defaultIdentifier,
                            indexPath: indexPath)
    }
    
    ///Dequeue a cell with automatic casting
    private func dequeue<T: UITableViewCell>(withIdentifier id: String, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: id, for: indexPath) as! T
    }
}
