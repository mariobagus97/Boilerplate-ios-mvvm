//
//  AuthRepository.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 12/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import RxSwift
import KeychainAccess




class AuthRepository : IAuthRepository {
    
    private let authService : AuthService
    
    init(authService : AuthService) {
        self.authService = authService
    }
    
    func Login(username: String, password: String) -> Completable {
        
        let response = authService.Login(username: username, password: password).map { (response) -> LoginResponse in
            if let token = response.token {
                let keychain = Keychain()
                keychain["TokenSession"] = token
//                let localdb = LocalDB()
//                localdb.AddToken(token: token)
            }
            return response
        }
        
        return response.asCompletable()
    }
    
    
}
