//
//  TextFieldCell.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import UIKit

protocol TextFieldCellDelegate: class {
    func didChangeWord(word: String)
}

class TextFieldCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var questionTitle: UILabel!
    
    weak var delegate: TextFieldCellDelegate?
    
    func configure(question: String, clearText: Bool, isEnabled: Bool, delegate: TextFieldCellDelegate) {
        self.delegate = delegate
        textField.isEnabled = isEnabled
        questionTitle.text = question
        if clearText { textField.text = "" }
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
    }
    
    @IBAction func insertingNewWord(_ sender: Any) {
        if let word = textField.text {
            delegate?.didChangeWord(word: word)
        }
    }
}
