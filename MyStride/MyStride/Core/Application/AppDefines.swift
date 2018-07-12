//
//  AppDefines.swift
//  MyStride
//
//  Created by Scor Doan on 7/10/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation

struct AppDefined {
    
    private static func getStringValue(key: String) -> String {
        guard let info = Bundle.main.infoDictionary else { return ""}
        return info[key] as? String ?? ""
    }
    
    struct App {
        static var Version: String {
            return getStringValue(key: "CFBundleShortVersionString")
        }
    }
    
    struct Api {
        static var BaseUrl: String {
            return getStringValue(key: "BaseApiDomain")
        }
        static var Version: String {
            return getStringValue(key: "ApiVersion")
        }
    }
    
    struct Amazon {
        static var PoolID = "us-east-1:5e5cd449-b057-4b66-b593-73a81c3f6cd4"
        static var ClientID = "5en00ekameg4h3t1kdhv48m8hq"
        static var UserPoolsSignInProviderKey = "UserPool"
        static var TokenKey = "cognito-idp.us-east-1.amazonaws.com/us-east-1_YA7NmvRlY"
        static var AuthenticatedLambdaKey = "AuthenticatedLambdaKey"
    }

    struct UserDefault {
        static var LastSelectedCountryCode = "LastSelectedCountryCode"
    }

}

