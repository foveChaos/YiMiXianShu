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
    
    func modifyTabBarItem(settings: TabBarItemSettings) -> UIViewController
}

extension TabBarControllerProtocol where Self: UITabBarController {
    
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
