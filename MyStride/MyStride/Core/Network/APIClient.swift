//
//  APIClient.swift
//  MyStride
//
//  Created by Scor Doan on 7/11/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import AWSCognitoIdentityProvider
import RxSwift
import AWSLambda


class CustomIdentityProvider: NSObject, AWSIdentityProviderManager {
    var tokens: NSDictionary = [String : String]() as NSDictionary
    
    init(tokens: [String : String]) {
        self.tokens = tokens as NSDictionary
    }
    
    func logins() -> AWSTask<NSDictionary> { // AWSIdentityProviderManager delegate method
        return AWSTask(result: tokens)
    }
    
}

class APIClient {
    
    static let shared = APIClient()
    
    var pool: AWSCognitoIdentityUserPool!
    var username = "user_id-" + UUID().uuidString//UIDevice.current.identifierForVendor!.uuidString
    var currentUser:AWSCognitoIdentityUser? {
        get {
            return self.pool.getUser(username)
        }
    }
    var currentSession: String?
    var token: String?
    
    init() {
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: AppDefined.Amazon.PoolID)
        credentialsProvider.invalidateCachedTemporaryCredentials()
        let serviceConfiguration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialsProvider)
        let configuration = AWSCognitoIdentityUserPoolConfiguration(clientId: AppDefined.Amazon.ClientID, clientSecret: nil, poolId: AppDefined.Amazon.PoolID)
        AWSCognitoIdentityUserPool.register(with: serviceConfiguration, userPoolConfiguration: configuration, forKey: AppDefined.Amazon.UserPoolsSignInProviderKey)

        self.pool = AWSCognitoIdentityUserPool.init(forKey: AppDefined.Amazon.UserPoolsSignInProviderKey)
        
        //Setup Provider
        credentialsProvider.invalidateCachedTemporaryCredentials()
        AWSServiceManager.default().defaultServiceConfiguration = serviceConfiguration
        AWSCognitoIdentityProvider.register(with: serviceConfiguration!, forKey: AppDefined.Amazon.UserPoolsSignInProviderKey)
        
        
        
    }
    
    private func updateCredentials() {
        var credentialsProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: AppDefined.Amazon.PoolID)
        if let token = self.token {
            let customProvider = CustomIdentityProvider(tokens: ["cognito-idp.us-east-1.amazonaws.com/us-east-1_YA7NmvRlY" : token])
            credentialsProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: AppDefined.Amazon.PoolID, identityProviderManager: customProvider)
        }
        credentialsProvider.invalidateCachedTemporaryCredentials()
        let serviceConfiguration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialsProvider)
        let configuration = AWSCognitoIdentityUserPoolConfiguration(clientId: AppDefined.Amazon.ClientID, clientSecret: nil, poolId: AppDefined.Amazon.PoolID)
        AWSCognitoIdentityUserPool.register(with: serviceConfiguration, userPoolConfiguration: configuration, forKey: AppDefined.Amazon.UserPoolsSignInProviderKey)
        
        //Setup Provider
        credentialsProvider.invalidateCachedTemporaryCredentials()
        AWSServiceManager.default().defaultServiceConfiguration = serviceConfiguration
        AWSCognitoIdentityProvider.register(with: serviceConfiguration!, forKey: AppDefined.Amazon.UserPoolsSignInProviderKey)
        
        AWSLambdaInvoker.register(with: serviceConfiguration!, forKey: AppDefined.Amazon.AuthenticatedLambdaKey)
    }
    
    func clearUser() {
        self.token = nil
        self.currentSession = nil
        self.pool.clearLastKnownUser()
        self.pool.currentUser()?.signOut()
    }
    
    //Signup (user registration)
    func signUp(userInfos: [AWSCognitoIdentityUserAttributeType]) -> Observable<Any> {
        username = "user_id-" + UUID().uuidString
        return Observable.create({ [unowned self] (observer) -> Disposable in
            self.pool.signUp(self.username, password: "Stride@1234", userAttributes: userInfos, validationData: nil).continueWith { (task) -> Any? in
                if let error = task.error as NSError? {
                    let message = (error.userInfo["message"] as? String) ?? "Unknow"
                    observer.onError(StrideError(code: error.code, message: message))
                    return nil
                }
                observer.onNext(task.result as Any)
                observer.onCompleted()
                return nil
            }
            return NopDisposable.instance
        })
    }
    
    //ConfirmSignUp (by phone number confirmation with SMS code)
    func confirmSignUp(code: String) -> Observable<Any> {
        return Observable.create({ [unowned self] (observer) -> Disposable in
            self.currentUser?.confirmSignUp(code, forceAliasCreation: true).continueWith { (task) -> AnyObject? in
                if let error = task.error as NSError? {
                    let message = (error.userInfo["message"] as? String) ?? "Unknow"
                    observer.onError(StrideError(code: error.code, message: message))
                    return nil
                }
                observer.onNext(task.result as Any)
                observer.onCompleted()
                return nil
            }
            
            return NopDisposable.instance
        })
    }
    
    //Resend SMS confirmation code
    func resendConfirmationCode() -> Observable<Any> {
        return Observable.create({ [unowned self] (observer) -> Disposable in
            self.currentUser?.resendConfirmationCode().continueWith { (task) -> AnyObject? in
                if let error = task.error as NSError? {
                    let message = (error.userInfo["message"] as? String) ?? "Unknow"
                    observer.onError(StrideError(code: error.code, message: message))
                    return nil
                }
                observer.onNext(task.result as Any)
                observer.onCompleted()
                return nil
            }
            
            return NopDisposable.instance
        })
    }
    
    // Request SMS code to auth
    func requestSMSCode(phone: String) -> Observable<Any> {
        self.clearUser()
        let authParams = [
            "USERNAME": phone,
            "CHALLENGE_NAME": "SMS_MFA"
        ]
        let req = AWSCognitoIdentityProviderInitiateAuthRequest()!
        req.authFlow = .customAuth
        req.clientId = AppDefined.Amazon.ClientID
        req.authParameters = authParams
        
        return Observable.create({ (observer) -> Disposable in
            AWSCognitoIdentityProvider.default().initiateAuth(req).continueWith { (task) -> AnyObject? in
                if let error = task.error as NSError? {
                    let message = (error.userInfo["message"] as? String) ?? "Unknow"
                    observer.onError(StrideError(code: error.code, message: message))
                    return nil
                }
                self.currentSession = task.result?.session
                if let username = task.result?.challengeParameters?["USERNAME"] {
                    self.username = username
                }
                observer.onNext(task.result as Any)
                observer.onCompleted()
                return nil
            }
            
            return NopDisposable.instance
        })
    }
    
    // Auth with SMS code
    func authWithSMSCode(_ code: String) -> Observable<Any> {

        let response = AWSCognitoIdentityProviderRespondToAuthChallengeRequest()!
        response.challengeName = .customChallenge
        response.clientId = AppDefined.Amazon.ClientID
        response.challengeResponses = [
                                        "USERNAME": username,
                                        "ANSWER": code
                                    ]
        response.session = self.currentSession
        return Observable.create({ (observer) -> Disposable in
            AWSCognitoIdentityProvider.default().respond(toAuthChallenge: response).continueWith { (task) -> AnyObject? in
                if let error = task.error as NSError? {
                    let message = (error.userInfo["message"] as? String) ?? "Unknow"
                    observer.onError(StrideError(code: error.code, message: message))
                    return nil
                }
                self.token = task.result!.authenticationResult!.idToken
                self.updateCredentials()
                observer.onNext(task.result as Any)
                observer.onCompleted()
                return nil
            }
            
            return NopDisposable.instance
        })
    }
    
    //
    func lambda(_ name: String) -> Observable<Any> {
        //Lambda
        let lambdaInvoker = AWSLambdaInvoker.init(forKey: AppDefined.Amazon.AuthenticatedLambdaKey)
        let jsonObject = [String: Any]()

        return Observable.create({ (observer) -> Disposable in
            lambdaInvoker.invokeFunction(name, jsonObject: jsonObject)
                .continueWith { (task) -> AnyObject? in
                if let error = task.error as NSError? {
                    let message = (error.userInfo["message"] as? String) ?? "Unknow"
                    observer.onError(StrideError(code: error.code, message: message))
                    return nil
                }
                //self.token = task.result
                observer.onNext(task.result as Any)
                observer.onCompleted()
                return nil
            }
            
            return NopDisposable.instance
        })
    }
}

/**
 Represents a disposable that does nothing on disposal.
 Nop = No Operation
 */
public struct NopDisposable: Disposable {
    
    /**
     Singleton instance of `NopDisposable`.
     */
    public static let instance: Disposable = NopDisposable()
    
    init() {
        
    }
    
    /**
     Does nothing.
     */
    public func dispose() {
        
    }
}
