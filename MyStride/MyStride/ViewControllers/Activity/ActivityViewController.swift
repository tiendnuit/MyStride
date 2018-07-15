//
//  ActivityViewController.swift
//  MyStride
//
//  Created by Scor Doan on 7/15/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import SVProgressHUD

class ActivityViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
    }
    
    func setupNavigation() {
        let logOutButton = UIButton(type: .custom)
        logOutButton.titleLabel?.font = R.font.montserratBold(size: 16)
        logOutButton.setTitleColor(UIColor.StrideDarkGreen, for: .normal)
        logOutButton.setTitle("Logout", for: .normal)
        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: logOutButton)
        barButton.tintColor = UIColor.StrideDarkGreen
        
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func logOut() {
        let alert = UIAlertController(title: "Logout!", message: "Are you sure?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            //self.dismiss(animated: true, completion: nil)
            //Logout action
            APIClient.shared.clearUser()
            AppDelegate.shared.showLoginContainer()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
