//
//  UIViewController+Helper.swift
//  MyStride
//
//  Created by Scor Doan on 7/12/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

//MARK: - UIViewController
extension UIViewController {
    func showAlert(title: String?, msg: String?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showToast(message : String) {
        let height = CGFloat(30)
        let toastLabel = UILabel(frame: CGRect(x: 0, y: -height, width: self.view.frame.size.width, height: height))
        toastLabel.backgroundColor = UIColor.StrideRed
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = R.font.montserratRegular(size: 12)
        toastLabel.text = message
        
        self.view.addSubview(toastLabel)
        
        let closeToast = {
            UIView.animate(withDuration: 3.0, animations: {
                toastLabel.alpha = 0.0
            }, completion: { (finished) in
                toastLabel.removeFromSuperview()
            })
        }
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .beginFromCurrentState, animations: {
            toastLabel.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: height)
        }, completion: {(isCompleted) in
            closeToast()
        })
    }
    
    func showLoading(_ show: Bool) {
        if show {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    //MARK: - Navigation
    public func setTitleNavigationBar(_ title: String) {
        self.title = title
    }
    
    
    public func generateBackAction(with title:String = "Cancel") -> UIBarButtonItem {
        let backButton = UIButton(type: .custom)
        backButton.titleLabel?.font = R.font.montserratBold(size: 16)
        backButton.setTitleColor(UIColor.StrideDarkGreen, for: .normal)
        backButton.setTitle(title, for: .normal)
        backButton.addTarget(self, action: #selector(closePages(_:)), for: .touchUpInside)
        let backBarButton = UIBarButtonItem(customView: backButton)
        backBarButton.tintColor = UIColor.StrideDarkGreen
        return backBarButton
    }
    
    
    public func addLeftButtonNavigationBar(buttons: [UIBarButtonItem]?) {
        if buttons == nil || (buttons?.isEmpty)! {
            return
        }
        self.navigationItem.leftBarButtonItems = buttons
    }
    
    public func addRightButtonNavigationBar(buttons: [UIBarButtonItem]?) {
        if buttons == nil || (buttons?.isEmpty)! {
            return
        }
        self.navigationItem.rightBarButtonItems = buttons
    }
    
    public func showBack(with title:String = "Cancel") {
        self.navigationItem.leftBarButtonItem = generateBackAction(with: title)
    }
    
    @objc public func closePages (_ sender: Any?) {
        if let navigationController = navigationController, navigationController.viewControllers.first != self {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    public func endEditor () {
        self.view.endEditing(true)
    }
    
    func showViewController(viewController: UIViewController, _ isSetHiddenNavigationBar: Bool? = true, _ transitionStyle: UIModalTransitionStyle? = .coverVertical) {
        let nav = UINavigationController(rootViewController: viewController)
        nav.isNavigationBarHidden = isSetHiddenNavigationBar!
        nav.modalPresentationStyle = .overCurrentContext
        nav.modalTransitionStyle = transitionStyle!
        self.present(nav, animated: true, completion: nil)
    }
}

