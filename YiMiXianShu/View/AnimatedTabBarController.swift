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
        tabBar.tintColor = UIColor.green
        tabBar.barTintColor = UIColor.blue
        setViewControllers(makeControllers(), animated: true)
    }
}

extension AnimatedTabBarController {
    
    func makeControllers() -> [UIViewController] {
        
        var controllers = [UIViewController]()
        
        let homeViewController = findViewController(sbName: "Home", vcName: "HomeViewController")
        homeViewController.tabBarItem.title = "首页"
        homeViewController.tabBarItem.image = UIImage(named: "ico_viewgallery_normal")
        homeViewController.tabBarItem.selectedImage = UIImage(named: "ico_viewgallery_selected")
        controllers.append(homeViewController)
        
        let listViewController = findViewController(sbName: "List", vcName: "ListViewController")
        listViewController.tabBarItem.title = "分类"
        listViewController.tabBarItem.image = UIImage(named: "ico_category_normal")
        listViewController.tabBarItem.selectedImage = UIImage(named: "ico_category_selected")
        controllers.append(listViewController)
        
        let cartViewController = findViewController(sbName: "Cart", vcName: "CartViewController")
        cartViewController.tabBarItem.title = "购物车"
        cartViewController.tabBarItem.image = UIImage(named: "ico_cart_normal")
        cartViewController.tabBarItem.selectedImage = UIImage(named: "ico_cart_selected")
        controllers.append(cartViewController)
        
        let mineViewController = findViewController(sbName: "Mine", vcName: "MineViewController")
        mineViewController.tabBarItem.title = "我的"
        mineViewController.tabBarItem.image = UIImage(named: "ico_account_normal")
        mineViewController.tabBarItem.selectedImage = UIImage(named: "ico_account_selected")
        controllers.append(mineViewController)
        
        return controllers
    }
}

extension AnimatedTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("didSelect")
    }
}
