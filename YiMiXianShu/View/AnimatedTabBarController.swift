//
//  AnimatedTabBarController.swift
//  YiMiXianShu
//
//  Created by Sun Chao on 16/12/12.
//  Copyright © 2016年 Sun Chao. All rights reserved.
//

import Foundation
import UIKit

final class AnimatedTabBarController: UITabBarController, ViewControllerProtocol, TabBarControllerProtocol {
    
    override func viewDidLoad() {
        

    }
}

extension AnimatedTabBarController {
    
    func initialize() {
        makeControllers()
    }
}

extension AnimatedTabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("didSelect")
    }
}
