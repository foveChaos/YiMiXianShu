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
        setViewControllers(makeControllers(), animated: true)
    }
}

extension AnimatedTabBarController {
    
    func makeControllers() -> [UIViewController] {
        
        var controllers = [UIViewController]()
        
        let homeViewController = findViewController(sbName: "Home", vcName: "HomeViewController")
        homeViewController.tabBarItem.title = "首页"
        homeViewController.tabBarItem.image = UIImage.imageWithOriginalName(named: "ico_viewgallery_normal")
        homeViewController.tabBarItem.selectedImage = UIImage.imageWithOriginalName(named: "ico_viewgallery_selected")
        homeViewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: UIControlState.normal)
        controllers.append(homeViewController)
        
        let listViewController = findViewController(sbName: "List", vcName: "ListViewController")
        listViewController.tabBarItem.title = "分类"
        listViewController.tabBarItem.image = UIImage.imageWithOriginalName(named: "ico_category_normal")
        listViewController.tabBarItem.selectedImage = UIImage.imageWithOriginalName(named: "ico_category_selected")
        listViewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: UIControlState.selected)
        controllers.append(listViewController)
        
        let cartViewController = findViewController(sbName: "Cart", vcName: "CartViewController")
        cartViewController.tabBarItem.title = "购物车"
        cartViewController.tabBarItem.image = UIImage.imageWithOriginalName(named: "ico_cart_normal")
        cartViewController.tabBarItem.selectedImage = UIImage.imageWithOriginalName(named: "ico_cart_selected")
        controllers.append(cartViewController)
        
        let mineViewController = findViewController(sbName: "Mine", vcName: "MineViewController")
        mineViewController.tabBarItem.title = "我的"
        mineViewController.tabBarItem.image = UIImage.imageWithOriginalName(named: "ico_account_normal")
        mineViewController.tabBarItem.selectedImage = UIImage.imageWithOriginalName(named: "ico_account_selected")
        controllers.append(mineViewController)
        
        return controllers
    }
    
    func playBounceAnimation(icon : UIImageView) {
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(2.0)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.add(bounceAnimation, forKey: "bounceAnimation")
    }
}

extension AnimatedTabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    
    override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didBeginCustomizing items: [UITabBarItem]) {
        
    }
}
