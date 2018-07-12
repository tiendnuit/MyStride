//
//  CircularButton.swift
//  MyStride
//
//  Created by Scor Doan on 7/10/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit


class DesignableButton: UIButton {
    
    open override var isEnabled: Bool{
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }
    
    func prepareUI() {
        
    }
    
    func prepareStaticUI() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        prepareUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareUI()
        prepareStaticUI()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        prepareUI()
        prepareStaticUI()
    }
    
}


class CircularButton: DesignableButton {

    override func prepareUI() {
        
        layoutIfNeeded()
        layer.cornerRadius = frame.size.height / 2.0
        layer.borderWidth = CGFloat(borderWidth)
        layer.borderColor = borderColor?.cgColor ?? UIColor.clear.cgColor
        clipsToBounds = true
    }
    
}
