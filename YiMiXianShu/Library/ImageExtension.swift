//
//  ImageExtension.swift
//  YiMiXianShu
//
//  Created by Sun Chao on 16/12/13.
//  Copyright © 2016年 Sun Chao. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    class func imageWithOriginalName(named: String) -> UIImage? {
        let image = UIImage(named: named)
        if let image = image {
            return image.withRenderingMode(.alwaysOriginal)
        }
        return nil
    }
}
