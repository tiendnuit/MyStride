//
//  NavigationHandler.swift
//  MyStride
//
//  Created by Scor Doan on 7/15/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit

protocol NavigatorHandler {
    func showLoginContainer(withWindow window: UIWindow?)
    func showHomePage(withWindow window: UIWindow?)
    func showLogin(withWindow window: UIWindow?)
}

extension NavigatorHandler {
    
    func showLoginContainer(withWindow window: UIWindow?) {
        window?.subviews.forEach { $0.removeFromSuperview() }
        window?.rootViewController = nil
        window?.rootViewController = R.storyboard.main.instantiateInitialViewController()
        window?.makeKeyAndVisible()
    }
    
    func showHomePage(withWindow window: UIWindow?) {
        window?.rootViewController = nil
        window?.rootViewController = R.storyboard.homePage.instantiateInitialViewController()
        window?.makeKeyAndVisible()
    }
    
    func showLogin(withWindow window: UIWindow?) {
        if let nav = window?.rootViewController as? UINavigationController, let loginContainer = nav.viewControllers.first as? LoginContainerViewController {
            loginContainer.goToLogin()
        }
    }
}
