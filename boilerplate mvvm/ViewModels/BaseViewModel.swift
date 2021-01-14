//
//  BaseViewModel.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 11/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


class BaseViewModel : NSObject {
    
    
    var alertError :  PublishSubject<String> = PublishSubject()
    var isLoading : BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
//    
//    required override init() {
//        isLoading = BehaviorRelay(value: false)
//    }
    
    func showLoading() {
        isLoading.accept(true)
    }
    
    func hideLoading() {
        isLoading.accept(false)
    }
    
}

extension Completable {
    
    func hideLoading(_ baseViewModel:BaseViewModel) -> Completable {
        return
            self.do(onCompleted: {
                baseViewModel.hideLoading() })
                .do(onError: { err in
                    baseViewModel.hideLoading() })
    }
    
}
