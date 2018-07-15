//
//  StrideError.swift
//  MyStride
//
//  Created by Scor Doan on 7/10/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation

struct StrideError: Swift.Error, LocalizedError {
    var code: Int
    var message: String
    
    static var InvalidPhoneNumber = StrideError(code: 0, message: "Please check that your number is 10 digits.")
    static var InvalidCode = StrideError(code: 0, message: "Please make sure your code is 6 digits.")
    static var InvalidHandleName = StrideError(code: 0, message: "Your Handle must be 5 to 20 charachters long.")
    static var UnknownError = StrideError(code: 0, message: "Sorry, something went wrong.")
    
    var errorDescription: String? {
        return message
    }
}
