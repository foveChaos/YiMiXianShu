//
//  ViewControllerProtocol.swift
//  YiMiXianShu
//
//  Created by Sun Chao on 16/12/12.
//  Copyright © 2016年 Sun Chao. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerProtocol {
    
    func findViewController(sbName: String, vcName: String) -> UIViewController
    
    func showViewController(controller: UIViewController)
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
}
