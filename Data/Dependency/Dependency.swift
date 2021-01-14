//
//  Dependency.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 18/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import Cleanse

struct HeaderModule : Module {
    
   static func configure(binder: UnscopedBinder) {
        binder.bind(RequestHeader.self)
              .to(factory: RequestHeaderImpl.init)
    }
}

struct AuthServiceModule : Module {
   static func configure(binder: UnscopedBinder) {
     binder.include(module: HeaderModule.self)
    
        binder.bind(AuthService.self)
                   .to(factory: AuthService.init)
    }
}

struct AuthRepoModule : Module {
   static func configure(binder: UnscopedBinder) {
        binder.include(module: AuthServiceModule.self)
    
    binder.bind(IAuthRepository.self)
        .to(factory: AuthRepository.init)
    }
}

struct HomeServiceModule : Module {
   static func configure(binder: UnscopedBinder) {
     binder.include(module: HeaderModule.self)
    
        binder.bind(HomeService.self)
                   .to(factory: HomeService.init)
    }
}

struct HomeRepoModule : Module {
   static func configure(binder: UnscopedBinder) {
        binder.include(module: HomeServiceModule.self)
    
    binder.bind(IHomeRepository.self)
        .to(factory: HomeRepository.init)
    }
}

//
//struct AuthRepoComponent : RootComponent {
//    typealias Root = IAuthRepository
//
//    static func configureRoot(binder bind: ReceiptBinder<IAuthRepository>) -> BindingReceipt<IAuthRepository> {
//        return bind.to(factory: AuthRepository.init)
//    }
//
//    static func configure(binder: UnscopedBinder) {
//        binder.include(module: AuthRepoModule.self)
//    }
//}




