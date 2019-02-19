//
//  RoundedButton.swift
//  ImaginaryBankLocator
//
//  Created by Majlinda Llugiqi on 2/16/19.
//  Copyright © 2019 Majlinda Llugiqi. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
