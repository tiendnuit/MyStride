//
//  HandleViewModel.swift
//  MyStride
//
//  Created by Scor Doan on 7/12/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import AWSCognitoIdentityProvider

final class HandleViewModel: ViewModelType {
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let errorNameTracker = ErrorTracker()
        
        let canContinue = input.name.map{!$0.isEmpty}
        
        
        let handleAvailable = input.continueTrigger
            .withLatestFrom(input.name)
            .flatMap { (phone) in
                return self.checkValidate(phone)
                    .trackError(errorNameTracker)
                    .asDriverOnErrorJustComplete()
            }
            .flatMap { (name) -> SharedSequence<DriverSharingStrategy, Bool> in
                return APIClient.shared.checkHandleAvailable(name)
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
                    //.mapToVoid()
            }
        
        let continueTrigger = handleAvailable.filter {$0 == true}
            .withLatestFrom(input.name)
            .flatMapLatest { (name) -> SharedSequence<DriverSharingStrategy, Void> in
                return APIClient.shared.saveHandle(name)
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
                    .mapToVoid()
            }

        
        return Output(continueTrigger: continueTrigger,
                      handleAvailable: handleAvailable,
                      canContinue: canContinue,
                      invalidName:errorNameTracker.asDriver(),
                      error: errorTracker.asDriver(),
                      loading: activityIndicator.asDriver())
    }
    
    func checkValidate(_ name: String) -> Observable<String> {
        return Observable.create({ observer -> Disposable in
            if name.count >= 5 && name.count <= 20 {
                observer.onNext(name)
                observer.onCompleted()
            } else {
                // .Error sequence will be automatically completed
                observer.onError(StrideError.InvalidHandleName)
            }
            return Disposables.create()
        })
    }
}

extension HandleViewModel {
    struct Input {
        let continueTrigger: Driver<Void>
        let name: Driver<String>
    }
    
    struct Output {
        let continueTrigger: Driver<Void>
        let handleAvailable: Driver<Bool>
        let canContinue: Driver<Bool>
        let invalidName: Driver<Error>
        let error: Driver<Error>
        let loading:Driver<Bool>
    }
}
