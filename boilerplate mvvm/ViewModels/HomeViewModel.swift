//
//  HomeViewModel.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 28/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: BaseViewModel {
    
    var homeContents = BehaviorRelay<[ProductContent]>(value: [ProductContent]())
    
    private var homeRepository: IHomeRepository!
    
    required init(homeRepository : IHomeRepository) {
        self.homeRepository = homeRepository
        
    }
    
    func getCategory(onComplete: @escaping () -> ()) {
        
        homeRepository.getListCategory()
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { (result) in
                self.homeContents.accept(result)
                onComplete()
            }) { (error) in
                let errorMessage = error.localizedDescription
                self.alertError.onNext(errorMessage)
        }
        
    }
    
    
}
