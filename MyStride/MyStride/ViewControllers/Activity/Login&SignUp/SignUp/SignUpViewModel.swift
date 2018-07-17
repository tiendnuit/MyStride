//
//  SignUpViewModel.swift
//  MyStride
//
//  Created by Scor Doan on 7/10/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import AWSCognitoIdentityProvider

final class SignUpViewModel: ViewModelType {
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let infos = Driver.combineLatest(input.firstName, input.lastName, input.phoneNumber) {
            return ($0, $1, $2)
        }
        
        let errorTracker = ErrorTracker()
        let errorPhoneTracker = ErrorTracker()
        
        let canContinue = Driver.combineLatest(input.firstName, input.lastName) {
            return !$0.isEmpty && !$1.isEmpty
        }
        
        let canSendCode = input.phoneNumber.map{!$0.isEmpty}
        
        let continueTrigger = input.continueTrigger.mapToVoid()
        
        //SendCode trigger -> check validate and register user
        let sendCodeTrigger = input.sendCodeTrigger
            .withLatestFrom(infos)
            .flatMap { (arg) in
                return self.checkValidate(arg.0, arg.1, arg.2)
                    .trackError(errorPhoneTracker)
                    .asDriverOnErrorJustComplete()
            }
            .flatMap { (arg) -> SharedSequence<DriverSharingStrategy, Void> in
                let (firstName, lastName, phone) = arg
                return self.signUp(firstName, lastName, phone)
                        .trackActivity(activityIndicator)
                        .trackError(errorTracker)
                        .asDriverOnErrorJustComplete()
                        .mapToVoid()
            }
    
        return Output(continueTrigger: continueTrigger,
                      sendCodeTrigger: sendCodeTrigger,
                      canContinue: canContinue,
                      canSendCode: canSendCode,
                      invalidPhone:errorPhoneTracker.asDriver(),
                      error: errorTracker.asDriver(),
                      loading: activityIndicator.asDriver())
    }

    func checkValidate(_ firstName: String, _ lastName: String, _ phone: String) -> Observable<(String, String, String)> {
        return Observable.create({ observer -> Disposable in
            if phone.isPhoneNumber {
                observer.onNext((firstName, lastName, phone))
                observer.onCompleted()
            } else {
                // .Error sequence will be automatically completed
                observer.onError(StrideError.InvalidPhoneNumber)
            }
            return Disposables.create()
        })
    }
    
    func signUp(_ firstName: String, _ lastName: String, _ phoneNumber: String) -> Observable<(Any)> {
        //Get country
        let userDefaults = UserDefaults.standard
        var country = Country.default
        if let countryCode = userDefaults.string(forKey: AppDefined.UserDefault.LastSelectedCountryCode), let index = DataManager.shared.countries.index(where: {$0.countryCode == countryCode}) {
            country = DataManager.shared.countries[index]
        }
        
        let phoneNo = "+\(country.phonePrefix)\(phoneNumber)"
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
        locale.value = Locale.current.regionCode ?? "US"
        userInfos.append(locale)
        
        
        
        let phone = AWSCognitoIdentityUserAttributeType()
        phone?.name = "phone_number"
        phone?.value = phoneNo
        userInfos.append(phone!)

        return APIClient.shared.signUp(username: phoneNo, userInfos: userInfos)
    }
}

extension SignUpViewModel {
    struct Input {
        let continueTrigger: Driver<Void>
        let sendCodeTrigger: Driver<Void>
        let lastName: Driver<String>
        let firstName: Driver<String>
        let phoneNumber: Driver<String>
    }
    
    struct Output {
        let continueTrigger: Driver<Void>
        let sendCodeTrigger: Driver<Void>
        let canContinue: Driver<Bool>
        let canSendCode: Driver<Bool>
        let invalidPhone: Driver<Error>
        let error: Driver<Error>
        let loading:Driver<Bool>
    }
}
