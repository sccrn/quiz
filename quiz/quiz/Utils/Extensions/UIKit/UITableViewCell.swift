//
//  UITableViewCell.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation
import UIKit

public extension UITableViewCell {
    
    ///Return the identifier with the same of the subclass
    static var defaultIdentifier: String {
        return String(describing: self)
    }
}
