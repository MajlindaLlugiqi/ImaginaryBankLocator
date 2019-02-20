//
//  File.swift
//  ImaginaryBankLocator
//
//  Created by Majlinda Llugiqi on 2/19/19.
//  Copyright © 2019 Majlinda Llugiqi. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor){
        let gradientLayer = CAGradientLayer()
      //  gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        var updatedFrame = self.bounds
        updatedFrame.size.height += self.frame.height
        updatedFrame.size.width += self.frame.width + 20
        //origin.x //+ 15
        
        //gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
        
        gradientLayer.frame = updatedFrame
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
