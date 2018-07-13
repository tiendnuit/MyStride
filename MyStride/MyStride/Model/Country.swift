//
//  Country.swift
//  MyStride
//
//  Created by Scor Doan on 7/11/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation

struct Country: Codable {
    var countryCode: String
    var phonePrefix: Int
    var englishName: String
    var languageCodes: [String]
    
    static let `default` = Country(countryCode: "US", phonePrefix: 1, englishName: "United States", languageCodes: ["en"])
    
    //current
    static var current:Country {
        get {
            let userDefaults = UserDefaults.standard
            var country = Country.default
            if let countryCode = userDefaults.string(forKey: AppDefined.UserDefault.LastSelectedCountryCode), let index = DataManager.shared.countries.index(where: {$0.countryCode == countryCode}) {
                country = DataManager.shared.countries[index]
            }
            return country
        }
    }
}
