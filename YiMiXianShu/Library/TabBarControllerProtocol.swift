//
//  TabBarControllerProtocol.swift
//  YiMiXianShu
//
//  Created by Sun Chao on 16/12/13.
//  Copyright © 2016年 Sun Chao. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarControllerProtocol {
    
    func makeControllers()
}

extension TabBarControllerProtocol where Self: UITabBarController {
    
    func makeControllers() {
        
        var controllers = [UIViewController]()
        
        var homeSettings = TabBarItemSettings(storyboardName: "Home", viewControllerName: "HomeViewController")
        homeSettings.title = "首页"
        homeSettings.image = UIImage.imageWithOriginalName(named: "ico_viewgallery_normal")
        homeSettings.selectedImage = UIImage.imageWithOriginalName(named: "ico_viewgallery_selected")
        let homeViewController = modifyTabBarItem(settings: homeSettings)
        let homeNavigation = UINavigationController(rootViewController: homeViewController)
        homeNavigation.hidesBottomBarWhenPushed = true
        controllers.append(homeNavigation)
        
        var listSettings = TabBarItemSettings(storyboardName: "List", viewControllerName: "ListViewController")
        listSettings.title = "分类"
        listSettings.image = UIImage.imageWithOriginalName(named: "ico_category_normal")
        listSettings.selectedImage = UIImage.imageWithOriginalName(named: "ico_category_selected")
        let listViewController = modifyTabBarItem(settings: listSettings)
        let listNavigation = UINavigationController(rootViewController: listViewController)
        listNavigation.hidesBottomBarWhenPushed = true
        controllers.append(listNavigation)
        
        var cartSettings = TabBarItemSettings(storyboardName: "Cart", viewControllerName: "CartViewController")
        cartSettings.title = "购物车"
        cartSettings.image = UIImage.imageWithOriginalName(named: "ico_cart_normal")
        cartSettings.selectedImage = UIImage.imageWithOriginalName(named: "ico_cart_selected")
        let cartViewController = modifyTabBarItem(settings: cartSettings)
        let cartNavigation = UINavigationController(rootViewController: cartViewController)
        cartNavigation.hidesBottomBarWhenPushed = true
        controllers.append(cartNavigation)
        
        var mineSettings = TabBarItemSettings(storyboardName: "Mine", viewControllerName: "MineViewController")
        mineSettings.title = "我的"
        mineSettings.image = UIImage.imageWithOriginalName(named: "ico_account_normal")
        mineSettings.selectedImage = UIImage.imageWithOriginalName(named: "ico_account_selected")
        let mineViewController = modifyTabBarItem(settings: mineSettings)
        let mineNavigation = UINavigationController(rootViewController: mineViewController)
        mineNavigation.hidesBottomBarWhenPushed = true
        controllers.append(mineNavigation)
        
        setViewControllers(controllers, animated: true)
    }
}

fileprivate extension TabBarControllerProtocol {
    
    func modifyTabBarItem(settings: TabBarItemSettings) -> UIViewController {
        
        let storyboard = UIStoryboard(name: settings.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: settings.viewControllerName)
        
        viewController.tabBarItem.title = settings.title
        viewController.tabBarItem.image = settings.image
        viewController.tabBarItem.selectedImage = settings.selectedImage
        
        if let titleColor = settings.titleColor {
            viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: titleColor], for: UIControlState.normal)
        }
        
        if let selectedTitleColor = settings.selectedTitleColor {
            viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: selectedTitleColor], for: UIControlState.selected)
        }
        
        return viewController
    }
    
    func setTitleColor(color: UIColor, selectedColor: UIColor) {
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: color], for: UIControlState.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: selectedColor], for: UIControlState.selected)
    }
    
}

struct TabBarItemSettings {
    var storyboardName: String
    var viewControllerName: String
    var title: String?
    var titleColor: UIColor?
    var selectedTitleColor: UIColor?
    var image: UIImage?
    var selectedImage: UIImage?
    
    init(storyboardName: String, viewControllerName: String) {
        self.storyboardName = storyboardName
        self.viewControllerName = viewControllerName
    }
}
