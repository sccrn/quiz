//
//  TextFieldCell.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var questionTitle: UILabel!
    
    func configure(question: String) {
        questionTitle.text = question
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
    }
}
