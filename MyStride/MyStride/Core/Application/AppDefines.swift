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
        static var PoolID = "us-east-1:068bb479-a9ee-46f1-938d-6eac771c42b6"//us-east-1:e3d17856-b413-4fc5-b7e5-8ba38f551c29"//us-east-1:5e5cd449-b057-4b66-b593-73a81c3f6cd4"
        static var ClientID = "6so3lapf4knkm2k01c5e52be0l"//24eee1lk9of658bgmroslcf2rh"//1c2nh32aqirqkkskptg6gts4t4"
        static var UserPoolsSignInProviderKey = "UserPool"
        static var TokenKey = "cognito-idp.us-east-1.amazonaws.com/us-east-1_YA7NmvRlY"
        static var AuthenticatedLambdaKey = "AuthenticatedLambdaKey"
        
        struct LambdaFunction {
            static var IsHandleAvailable = "isHandleAvailable"
            static var GetUserOnboardStatus = "getUserOnboardStatus"
            static var SaveHandle = "saveHandle"
        }
    }

    struct UserDefault {
        static var LastSelectedCountryCode = "LastSelectedCountryCode"
    }

}

