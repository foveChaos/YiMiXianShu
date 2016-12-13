//
//  AnimatedTabBarController.swift
//  YiMiXianShu
//
//  Created by Sun Chao on 16/12/12.
//  Copyright © 2016年 Sun Chao. All rights reserved.
//

import Foundation
import UIKit

class AnimatedTabBarController: UITabBarController, ViewControllerProtocol, TabBarControllerProtocol {
    
    override func viewDidLoad() {
        setViewControllers(makeControllers(), animated: true)
    }
}

extension AnimatedTabBarController {
    
    func makeControllers() -> [UIViewController] {
        
        var controllers = [UIViewController]()
        
        var homeSettings = TabBarItemSettings(storyboardName: "Home", viewControllerName: "HomeViewController")
        homeSettings.title = "首页"
        homeSettings.image = UIImage.imageWithOriginalName(named: "ico_viewgallery_normal")
        homeSettings.selectedImage = UIImage.imageWithOriginalName(named: "ico_viewgallery_selected")
        let homeViewController = modifyTabBarItem(settings: homeSettings)
        controllers.append(homeViewController)
        
        var listSettings = TabBarItemSettings(storyboardName: "List", viewControllerName: "ListViewController")
        listSettings.title = "分类"
        listSettings.image = UIImage.imageWithOriginalName(named: "ico_category_normal")
        listSettings.selectedImage = UIImage.imageWithOriginalName(named: "ico_category_selected")
        let listViewController = modifyTabBarItem(settings: listSettings)
        controllers.append(listViewController)
        
        var cartSettings = TabBarItemSettings(storyboardName: "Cart", viewControllerName: "CartViewController")
        cartSettings.title = "购物车"
        cartSettings.image = UIImage.imageWithOriginalName(named: "ico_cart_normal")
        cartSettings.selectedImage = UIImage.imageWithOriginalName(named: "ico_cart_selected")
        let cartViewController = modifyTabBarItem(settings: cartSettings)
        controllers.append(cartViewController)
        
        var mineSettings = TabBarItemSettings(storyboardName: "Mine", viewControllerName: "MineViewController")
        mineSettings.title = "我的"
        mineSettings.image = UIImage.imageWithOriginalName(named: "ico_account_normal")
        mineSettings.selectedImage = UIImage.imageWithOriginalName(named: "ico_account_selected")
        let mineViewController = modifyTabBarItem(settings: mineSettings)
        controllers.append(mineViewController)
        
        return controllers
    }
}

extension AnimatedTabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("didSelect")
    }
    
    override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
        print("willBeginCustomizing")
    }
    
    override func tabBar(_ tabBar: UITabBar, didBeginCustomizing items: [UITabBarItem]) {
        print("didBeginCustomizing")
    }
}
