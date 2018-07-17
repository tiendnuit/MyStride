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
            .flatMap { (code) in
                return (self.fromSignUp ? APIClient.shared.confirmSignUp(code: code) : APIClient.shared.authWithSMSCode(code))
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
            }.flatMapLatest { (_) -> SharedSequence<DriverSharingStrategy, Bool> in
                return (self.fromSignUp ? Observable.just(true) : APIClient.shared.userOnboardStatus())
                    .trackActivity(activityIndicator)
                    //.trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
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
                      //onboardingStatus: onboardingStatus,
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

}

extension ConfirmationViewModel {
    struct Input {
        let continueTrigger: Driver<Void>
        let resendCodeTrigger: Driver<Void>
        let code: Driver<String>
        //let checkOnboardingStatus: Driver<Bool>
    }
    
    struct Output {
        let continueTrigger: Driver<Bool>
        let resendCodeTrigger: Driver<Void>
        let canContinue: Driver<Bool>
        let invalidCode: Driver<Error>
        let error: Driver<Error>
        let loading:Driver<Bool>
    }
}
