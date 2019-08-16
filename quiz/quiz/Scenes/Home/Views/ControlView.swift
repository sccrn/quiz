//
//  ControlView.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation
import UIKit

class ControlView: UIView, NibLoadable {
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var numberOfHits: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    @IBAction func actionStartReset(_ sender: Any) {
    }
    
}
