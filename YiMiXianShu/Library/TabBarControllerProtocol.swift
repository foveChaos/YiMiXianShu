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
        controllers.append(createMainScene(name: .home))
        controllers.append(createMainScene(name: .list))
        controllers.append(createMainScene(name: .cart))
        controllers.append(createMainScene(name: .mine))
        setViewControllers(controllers, animated: true)
    }
}

fileprivate extension TabBarControllerProtocol {
    
    func createRootViewController(settings: TabBarItemSettings) -> UIViewController {
        
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
    
    func createNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.hidesBottomBarWhenPushed = true
        return navigationController
    }
    
    func createMainScene(name: StoryboardName) -> UINavigationController {
        let settings = TabBarItemSettings(name: name)
        let viewController = createRootViewController(settings: settings)
        let navigation = createNavigationController(rootViewController: viewController)
        return navigation
    }
    
    func setTitleColor(color: UIColor, selectedColor: UIColor) {
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: color], for: UIControlState.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: selectedColor], for: UIControlState.selected)
    }
    
}

fileprivate enum StoryboardName: String {
    case home
    case list
    case cart
    case mine
}

fileprivate struct TabBarItemSettings {
    
    var storyboardName: String
    var viewControllerName: String
    var title: String
    var titleColor: UIColor?
    var selectedTitleColor: UIColor?
    var image: UIImage?
    var selectedImage: UIImage?
    
    init(name: StoryboardName) {
        
        if name == .home {
            storyboardName = "Home"
            viewControllerName = "HomeViewController"
            title = "首页"
            image = UIImage.imageWithOriginalName(named: "ico_viewgallery_normal")
            selectedImage = UIImage.imageWithOriginalName(named: "ico_viewgallery_selected")
        } else if name == .list {
            storyboardName = "List"
            viewControllerName = "ListViewController"
            title = "分类"
            image = UIImage.imageWithOriginalName(named: "ico_category_normal")
            selectedImage = UIImage.imageWithOriginalName(named: "ico_category_selected")
        } else if name == .cart {
            storyboardName = "Cart"
            viewControllerName = "CartViewController"
            title = "购物车"
            image = UIImage.imageWithOriginalName(named: "ico_cart_normal")
            selectedImage = UIImage.imageWithOriginalName(named: "ico_cart_selected")
        } else if name == .mine {
            storyboardName = "Mine"
            viewControllerName = "MineViewController"
            title = "我的"
            image = UIImage.imageWithOriginalName(named: "ico_account_normal")
            selectedImage = UIImage.imageWithOriginalName(named: "ico_account_selected")
        } else {
            storyboardName = ""
            viewControllerName = ""
            title = ""
        }
    }
}
