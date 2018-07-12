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
}
