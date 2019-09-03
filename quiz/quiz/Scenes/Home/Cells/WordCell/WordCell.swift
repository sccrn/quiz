//
//  WordCell.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import UIKit

class WordCell: UITableViewCell {
    @IBOutlet weak var wordLabel: UILabel!
    
    func configure(word: String) {
        wordLabel.text = word
        self.addBottomBorder(margins: 16)
    }
}
