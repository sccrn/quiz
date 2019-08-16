//
//  QZGradient.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import UIKit

///This class will do the view's gradient, we're using IBDesignable to set up
///in the XIB. For this class, we're putting clear colors to be generic.
@IBDesignable
class QZGradient: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet { setupGradient() }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet { setupGradient() }
    }
    
    override class var layerClass: AnyClass {
        get { return CAGradientLayer.self }
    }
    
    ///Creation of our layer and it's gonna present.
    func setupGradient() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map { $0.cgColor }
        layer.locations = [0.5, 0.35]
    }
}
