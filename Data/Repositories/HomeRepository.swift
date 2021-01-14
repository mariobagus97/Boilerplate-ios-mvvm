//
//  HomeRepository.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 28/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import RxSwift

struct HomeRepository : IHomeRepository {
    
    private let homeService  : HomeService
    
    init(homeService : HomeService) {
        self.homeService = homeService
    }
    
    func getListCategory() -> Single<[ProductContent]> {
        
        return homeService.GetListCategory()
            .map( {
                $0.map( {
                    $0.toEntity()!
                })
            } )
    }
    
    
}
