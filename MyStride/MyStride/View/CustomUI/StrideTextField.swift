//
//  StrideTextField.swift
//  MyStride
//
//  Created by Scor Doan on 7/10/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit


let DEFAULT_BUTTON_SIZE = CGFloat(40)

enum InputStatus: Int {
    case none = 0
    case valid
    case error
    
    var color:UIColor {
        switch self {
        case .valid:
            return UIColor.StrideGreen
        case .error:
            return UIColor.StrideRed
        default:
            return UIColor.StrideGray
        }
    }
}

class ResizableButton: UIButton {
    override var intrinsicContentSize: CGSize {
        let labelSize = titleLabel?.sizeThatFits(CGSize(width: frame.width, height: .greatestFiniteMagnitude)) ?? .zero
        let desiredButtonSize = CGSize(width: labelSize.width + titleEdgeInsets.left + titleEdgeInsets.right, height: labelSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom)
        
        return desiredButtonSize
    }
}

class StrideTextField: UITextField {
    var inputStatus = InputStatus.none {
        didSet {
            self.layer.borderColor = inputStatus.color.cgColor
            if inputStatus == .error {
                setRightButton(with: #imageLiteral(resourceName: "icon-red-close"))
            } else {
                setRightButton()
            }
        }
    }

    func prepareUI() {
    }
    
    func prepareStaticUI() {
        //set default font
        self.font = R.font.montserratRegular(size: 16)
        
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.borderWidth = 2.5
        self.layer.borderColor = inputStatus.color.cgColor
        
        setLeftButton()
        setRightButton()
    }
    
    func setLeftButton(attributedTitle: NSAttributedString? = nil, image: UIImage? = nil, closure:UIButtonTargetClosure? = nil) {
        let padding = CGFloat(10)
        
        //Default it's empty
        let button = ResizableButton(type: .custom)
        button.frame = CGRect(x: 0, y: (self.frame.size.height-DEFAULT_BUTTON_SIZE)/2, width: DEFAULT_BUTTON_SIZE + padding, height: DEFAULT_BUTTON_SIZE)
        
        if let attributedTitle = attributedTitle {
            button.setAttributedTitle(attributedTitle, for: .normal)
            let size = attributedTitle.boundingRect(with: CGSize(width: self.frame.size.width, height: DEFAULT_BUTTON_SIZE), options: .usesLineFragmentOrigin, context: nil)
            button.frame = CGRect(x: 0, y: (self.frame.size.height-DEFAULT_BUTTON_SIZE)/2, width: size.width + padding, height: DEFAULT_BUTTON_SIZE)
            button.titleEdgeInsets = UIEdgeInsetsMake(0, padding, 0, 0)
        }
        
        if let image = image {
            button.setImage(image, for: .normal)
            button.imageEdgeInsets = UIEdgeInsetsMake(0, padding, 0, 0)
        }
        
        
        
        if let closure = closure {
            //button.addTarget(self, action: action, for: .touchUpInside)
            button.addTargetClosure(closure: closure)
        }
        
        self.leftView = button
        self.leftViewMode = .always
    }
    
    fileprivate func setRightButton(with image: UIImage? = nil) {
        let padding = CGFloat(10)
        //Default it's empty
        let button = UIButton(type: .custom)
        if let image = image {
            button.setImage(image, for: .normal)
        }
        button.frame = CGRect(x: 0, y: (self.frame.size.height-DEFAULT_BUTTON_SIZE)/2, width: DEFAULT_BUTTON_SIZE+padding, height: DEFAULT_BUTTON_SIZE)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, padding)
        button.addTarget(self, action: #selector(self.rightButtonClicked), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @objc fileprivate func leftButtonClicked() {
        
        
    }
    
    @objc fileprivate func rightButtonClicked() {
        //Default is delete text
        if inputStatus == .error {
            self.text = ""
            self.inputStatus = .none
        }
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

////MARK: - PhoneTextField
//class PhoneTextField : StrideTextField {
//
//    override func prepareStaticUI() {
//        super.prepareStaticUI()
//
//        setLeftButton(title: "US ▼")
//    }
//
//    @objc fileprivate override func leftButtonClicked() {
//
//
//    }
//
//}

