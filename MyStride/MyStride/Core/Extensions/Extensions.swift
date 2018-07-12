//
//  Extensions.swift
//  MyStride
//
//  Created by Scor Doan on 7/10/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UIColor
extension UIColor {
    static let StrideGray = UIColor.colorWithHexString("BEB9C1")
    static let StrideRed = UIColor.colorWithHexString("DA4453")
    static let StrideGreen = UIColor.colorWithHexString("48CFAD")
    static let StrideDarkGreen = UIColor.colorWithHexString("3AAD8F")
    static let StrideText = UIColor.colorWithHexString("787D85")
    
    class func rgba(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    static func colorWithHexString(_ hex: String) -> UIColor {
        
        var cString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}

//MARK: - String
extension String {
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}
