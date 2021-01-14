//
//  HomeService.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 28/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import RxSwift

struct HomeService {
    
    private let header : RequestHeader
    init(header : RequestHeader) {
        self.header = header
    }
    
    func GetListCategory() -> Single<[HomeListResponse]> {
        
        return UrlBuilder<HomeListResponse>(requestHeader: header)
            .SetUrl(urlSegment: "/master/v1/category")
            .SetBasicHeader()
            .AddParameter(key: "page", value: 1)
            .AddParameter(key: "size", value: 150)
            .AddParameter(key: "type", value: "datatable")
            .AddParameter(key: "group_by", value: "type")
            .AddParameter(key: "status", value: "ACTIVE")
            .ExecuteArrayData(httpMethod: .get).asSingle()
    }
    
}
