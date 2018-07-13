//
//  LoginViewModel.swift
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
            .map { "+\(Country.current.phonePrefix)\($0)" }
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
