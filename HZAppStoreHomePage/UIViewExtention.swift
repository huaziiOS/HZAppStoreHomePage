//
//  UIViewExtention.swift
//  HZAppStoreHomePage
//
//  Created by 韩兆华 on 2017/9/5.
//  Copyright © 2017年 韩兆华. All rights reserved.
//

import UIKit

extension UIView {
    
    public func viewController() -> UIViewController? {
        
        var nextResponder: UIResponder? = self
        
        repeat {
            nextResponder = nextResponder?.next
            
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            
        } while nextResponder != nil
        
        return nil
    }
    
}
