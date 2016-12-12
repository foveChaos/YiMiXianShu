//
//  AnimatedTabBarController.swift
//  YiMiXianShu
//
//  Created by Sun Chao on 16/12/12.
//  Copyright © 2016年 Sun Chao. All rights reserved.
//

import Foundation
import UIKit

class AnimatedTabBarController: UITabBarController, ViewControllerProtocol {
    
    override func viewDidLoad() {
        
    }
}

extension AnimatedTabBarController {
    
    func makeControllers() -> [UIViewController] {
        
        var controllers = [UIViewController]()
        
        let homeViewController = findViewController(sbName: "Home", vcName: "HomeViewController")
        let listViewController = findViewController(sbName: "List", vcName: "ListViewController")
        let cartViewController = findViewController(sbName: "Cart", vcName: "CartViewController")
        let mineViewController = findViewController(sbName: "Mine", vcName: "MineViewController")
        
        controllers.append(homeViewController)
        controllers.append(listViewController)
        controllers.append(cartViewController)
        controllers.append(mineViewController)
        
        return controllers
    }
}
