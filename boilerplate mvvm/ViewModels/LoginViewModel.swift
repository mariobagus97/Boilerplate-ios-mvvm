//
//  LoginViewModel.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 12/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel: BaseViewModel {
    
    var isSuccess : PublishSubject<Bool> = PublishSubject()
    
    let username = BehaviorSubject<String>(value: "")
    let password = BehaviorSubject<String>(value: "")
    
    private var authRepository: IAuthRepository!
    
    required init(authRepository : IAuthRepository) {
        self.authRepository = authRepository
    }
    
    func login(){
        
        let uname = try! username.value()
        let pwd = try! password.value()
        
        showLoading()
        
        authRepository.Login(username: uname, password: pwd)
            .observeOn(MainScheduler.instance)
            .hideLoading(self)
            .subscribe(onCompleted: {
                self.isSuccess.onNext(true)
            }) { (error) in
                let errorMessage = error as! RuntimeError
                self.isSuccess.onNext(false)
                self.alertError.onNext(errorMessage.message)
        }
    }
    
}
