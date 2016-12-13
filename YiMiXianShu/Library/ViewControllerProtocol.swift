//
//  ViewControllerProtocol.swift
//  YiMiXianShu
//
//  Created by Sun Chao on 16/12/12.
//  Copyright © 2016年 Sun Chao. All rights reserved.
//

import Foundation
import UIKit

struct TabBarItemSettings {
    var storyboardName: String
    var viewControllerName: String
    var title: String?
    var titleColor: UIColor?
    var selectedTitleColor: UIColor?
    var image: UIImage?
    var selectedImage: UIImage?
    
    init(storyboardName: String, _ viewControllerName: String) {
        self.storyboardName = storyboardName
        self.viewControllerName = viewControllerName
    }
}

protocol ViewControllerProtocol {
    
    func findViewController(sbName: String, vcName: String) -> UIViewController
    
    func showViewController(controller: UIViewController)
    
    func modifyTabBarItem(settings: TabBarItemSettings) -> UIViewController
}

extension ViewControllerProtocol where Self: UIViewController {
    
    func findViewController(sbName: String, vcName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: sbName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: vcName)
        return viewController
    }
    
    func showViewController(controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func modifyTabBarItem(settings: TabBarItemSettings) -> UIViewController {
        
        let viewController = findViewController(sbName: settings.storyboardName, vcName: settings.viewControllerName)
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
