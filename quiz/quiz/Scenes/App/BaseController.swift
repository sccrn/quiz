//
//  BaseController.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-15.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class BaseController: UIViewController {
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func showLoading(message: String) {
        SVProgressHUD.show(withStatus: message)
    }
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showError(message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
}
