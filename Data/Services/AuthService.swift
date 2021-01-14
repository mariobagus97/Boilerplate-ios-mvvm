//
//  AuthService.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 12/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import RxSwift

class AuthService {
    
    private let header : RequestHeader
    init(header : RequestHeader) {
        self.header = header
    }
    
    func Login(username : String, password : String) -> Single<LoginResponse> {
        return UrlBuilder<LoginResponse>(requestHeader: header)
            .SetUrl(urlSegment: "/auth/v1/user/login")
            .SetBasicHeader()
            .AddLoginHeader(username: username, password: password)
            .Execute(httpMethod: .post)
            .asSingle()
    }
}

