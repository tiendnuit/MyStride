//
//  BaseNavigationController.swift
//  MyStride
//
//  Created by Scor Doan on 7/10/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupNavigationBar()

    }
    
//    func setupNavigationBar() {
//        //For back button in navigation bar
//        let backButton = UIButton(type: .custom)
//        backButton.setTitleColor(UIColor.StrideDarkGreen, for: .normal)
//        backButton.setTitle("Cancel", for: .normal)
//
//        //self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(customView: backButton)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
