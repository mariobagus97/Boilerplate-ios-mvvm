//
//  IAuthRepository.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 12/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import RxSwift

protocol IAuthRepository {
    func Login(username : String, password : String) -> Completable
}
