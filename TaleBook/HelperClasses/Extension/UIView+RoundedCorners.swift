//
//  UIView+RoundedCorners.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 1/11/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import UIKit

extension UIView {
    func addRoundedCorner(with radius: CGFloat = TBConstants.shared.cellRadius, borderThickness: CGFloat = TBConstants.shared.cellBorderThickness, borderColor: CGColor = TBConstants.shared.cellBorderColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderThickness
        self.layer.borderColor = borderColor
    }
    
    func roundedView() {
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
