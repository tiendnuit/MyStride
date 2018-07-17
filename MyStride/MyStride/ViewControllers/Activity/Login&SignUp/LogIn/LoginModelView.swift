//
//  LoginModelView.swift
//  MyStride
//
//  Created by Scor Doan on 7/11/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import AWSCognitoIdentityProvider

final class LoginViewModel: ViewModelType {
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let errorPhoneTracker = ErrorTracker()

        let canSendCode = input.phoneNumber.map{!$0.isEmpty}
        //SendCode trigger -> check validate and register user
        let sendCodeTrigger = input.sendCodeTrigger
            .withLatestFrom(input.phoneNumber)
            .flatMap { (phone) in
                return self.checkValidate(phone)
                    .trackError(errorPhoneTracker)
                    .asDriverOnErrorJustComplete()
            }
            .flatMap { (phone) -> SharedSequence<DriverSharingStrategy, Void> in
                return APIClient.shared.requestSMSCode(phone: phone)
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
                    .mapToVoid()
        }
        
        return Output(sendCodeTrigger: sendCodeTrigger,
                      canSendCode: canSendCode,
                      invalidPhone:errorPhoneTracker.asDriver(),
                      error: errorTracker.asDriver(),
                      loading: activityIndicator.asDriver())
    }
    
    func checkValidate(_ phone: String) -> Observable<String> {
        return Observable.create({ observer -> Disposable in
            if phone.isPhoneNumber {
                observer.onNext(phone)
                observer.onCompleted()
            } else {
                // .Error sequence will be automatically completed
                observer.onError(StrideError.InvalidPhoneNumber)
            }
            return Disposables.create()
        })
    }
    
    func signUp(_ firstName: String, _ lastName: String, _ phoneNumber: String) -> Observable<(Any)> {
        var userInfos = [AWSCognitoIdentityUserAttributeType]()
        
        let givenName = AWSCognitoIdentityUserAttributeType()!
        givenName.name = "given_name"
        givenName.value = firstName
        userInfos.append(givenName)
        
        let familyName = AWSCognitoIdentityUserAttributeType()!
        familyName.name = "family_name"
        familyName.value = lastName
        userInfos.append(familyName)
        
        let locale = AWSCognitoIdentityUserAttributeType()!
        locale.name = "locale"
        locale.value = Locale.current.currencySymbol ?? "US"
        userInfos.append(locale)
        
        
        let userDefaults = UserDefaults.standard
        var country = Country.default
        if let countryCode = userDefaults.string(forKey: AppDefined.UserDefault.LastSelectedCountryCode), let index = DataManager.shared.countries.index(where: {$0.countryCode == countryCode}) {
            country = DataManager.shared.countries[index]
        }
        let phone = AWSCognitoIdentityUserAttributeType()
        phone?.name = "phone_number"
        phone?.value = "+\(country.phonePrefix)\(phoneNumber)"
        userInfos.append(phone!)
        
        return APIClient.shared.signUp(userInfos: userInfos)
    }
}

extension LoginViewModel {
    struct Input {
        let sendCodeTrigger: Driver<Void>
        let phoneNumber: Driver<String>
    }
    
    struct Output {
        let sendCodeTrigger: Driver<Void>
        let canSendCode: Driver<Bool>
        let invalidPhone: Driver<Error>
        let error: Driver<Error>
        let loading:Driver<Bool>
    }
}
