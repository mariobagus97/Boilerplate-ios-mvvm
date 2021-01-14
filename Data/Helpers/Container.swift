//
//  Container.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 09/09/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class Container {

    let container = Swinject.Container()
    
    init() {
        container.autoregister(RequestHeader.self, initializer: RequestHeaderImpl.init)
        self.registerServices()
        self.registerRepositories()
        container.autoregister(LoginViewModel.self, initializer: LoginViewModel.init)
        container.autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
    }
    
    
    func getViewModel<T:BaseViewModel>(viewModel:T.Type) -> T? {
        
        if let vm = get(type: viewModel) {
            return vm
        }
         
        register(type: viewModel.self)
        return get(type: viewModel.self)
    }
    
    func register<T:NSObject>(type:T.Type) {
        container.autoregister(T.self, initializer: type.init)
    }
    
    func get<T:NSObject>(type:T.Type) -> T? {
        return container.resolve(type)
    }
    
    func registerRepositories() {
        
        container.autoregister(IAuthRepository.self, initializer: AuthRepository.init)
        container.autoregister(IHomeRepository.self, initializer: HomeRepository.init)
    }
    
    func registerServices() {
        
        container.autoregister(AuthService.self, initializer: AuthService.init)
        container.autoregister(HomeService.self, initializer: HomeService.init)
    }
    
}
