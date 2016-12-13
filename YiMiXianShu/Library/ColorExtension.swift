//
//  File.swift
//  YiMiXianShu
//
//  Created by Sun Chao on 16/12/13.
//  Copyright © 2016年 Sun Chao. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1)
    }
    
    convenience init(hexWithString hex: String) {

        var cString = hex
        var subStringIndex = 0
        
        if cString.hasPrefix("#") {
            subStringIndex = 1
        } else if cString.hasPrefix("0x") {
            subStringIndex = 2
        }
        
        let index = cString.index(cString.startIndex, offsetBy:subStringIndex)
        cString = cString.substring(from: index)
        
        var hexNum :UInt32 = 0
        Scanner(string: cString).scanHexInt32(&hexNum)
        
        self.init(hex: Int(hexNum))
    }
    
    convenience init(hex: Int, alpha: CGFloat) {
        
        let red = (hex>>16) & 0xFF
        let green = (hex>>8) & 0xFF
        let blue = hex & 0xFF
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
    }
}
