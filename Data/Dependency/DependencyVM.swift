//
//  Dependency.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 18/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import Cleanse

//struct LoginViewModelComponent : RootComponent {
//    
//    typealias Root = LoginViewModel
//    
//    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
//        return bind.to(factory : Root.init )
//    }
//    
//    static func configure(binder: Binder<Unscoped>) {
//        binder
//            .include(module: AuthRepoModule.self)
////        binder
////            .include(module: AuthRepoModule.self)
//        
//    }
//}
//
//struct HomeViewModelComponent : RootComponent {
//    
//    typealias Root = HomeViewModel
//    
//    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
//        return bind.to(factory : Root.init )
//    }
//    
//    static func configure(binder: Binder<Unscoped>) {
//        binder
//            .include(module: HomeRepoModule.self)
//        
//    }
//}
//
//struct ViewModelComponent<T:BaseViewModel> : RootComponent {
//    
//    typealias Root = T
//    
//    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
//        return bind.to(factory : Root.init)
//    }
//    
//    static func configure(binder: Binder<Unscoped>) {
//        binder
//            .include(module: HomeRepoModule.self)
//        
//    }
//}
