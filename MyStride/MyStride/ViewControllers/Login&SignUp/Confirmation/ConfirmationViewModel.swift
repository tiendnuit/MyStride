//
//  ConfirmationViewModel.swift
//  MyStride
//
//  Created by Scor Doan on 7/11/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import AWSCognitoIdentityProvider

final class ConfirmationViewModel: ViewModelType {
    
    var fromSignUp:Bool = true
    var phoneNumber: String?
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        
        let errorTracker = ErrorTracker()
        let errorCodeTracker = ErrorTracker()
        
        let canContinue = input.code.map{!$0.isEmpty}
        
        //Continue event
        let continueTrigger = input.continueTrigger
            .withLatestFrom(input.code)
            .flatMap { (code) in
                return self.checkValidate(code)
                    .trackError(errorCodeTracker)
                    .asDriverOnErrorJustComplete()
            }
            .flatMap { (code) -> SharedSequence<DriverSharingStrategy, Void> in
                return (self.fromSignUp ? APIClient.shared.confirmSignUp(code: code) : APIClient.shared.authWithSMSCode(code))
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
                    .mapToVoid()
            }
        
        //Resend event
        let resendTrigger = input.resendCodeTrigger
            .flatMap { () -> SharedSequence<DriverSharingStrategy, Void> in
                return (self.fromSignUp ? APIClient.shared.resendConfirmationCode() : APIClient.shared.requestSMSCode(phone: self.phoneNumber!))
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
                    .mapToVoid()
            }
        
        return Output(continueTrigger: continueTrigger,
                      resendCodeTrigger: resendTrigger,
                      canContinue: canContinue,
                      invalidCode:errorCodeTracker.asDriver(),
                      error: errorTracker.asDriver(),
                      loading: activityIndicator.asDriver())
    }
    
    func checkValidate(_ code: String) -> Observable<String> {
        return Observable.create({ observer -> Disposable in
            if code.count == 6 {
                observer.onNext(code)
                observer.onCompleted()
            } else {
                // .Error sequence will be automatically completed
                observer.onError(StrideError.InvalidCode)
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

extension ConfirmationViewModel {
    struct Input {
        let continueTrigger: Driver<Void>
        let resendCodeTrigger: Driver<Void>
        let code: Driver<String>
    }
    
    struct Output {
        let continueTrigger: Driver<Void>
        let resendCodeTrigger: Driver<Void>
        let canContinue: Driver<Bool>
        let invalidCode: Driver<Error>
        let error: Driver<Error>
        let loading:Driver<Bool>
    }
}
