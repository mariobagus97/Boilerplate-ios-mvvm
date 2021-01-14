//
//  HomeListCategoryResponse.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 28/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation

struct HomeListResponse : Codable {
    
    let type : ContentType
    let items : [HomeItemResponse]
    
    enum CodingKeys : String, CodingKey {
        case type
        case items = "categories"
    }
    
    func toEntity() -> ProductContent? {
        
        switch type {
        case .Voucher:
           return ProductContent(
                id: 0,
                title: "Voucher",
                subtitle: "Temukan semua voucher sesuai kebutuhan anda",
                priorityOrder: 0,
                type: type,
                serviceType: .Voucher,
                items: items.map({ $0.toEntity() }))
            
        case .Biller:
            return ProductContent(
                 id: 2,
                 title: "Layanan Lainnya",
                 subtitle: "Beli biller dan bayar tagihan mu disini",
                 priorityOrder: 2,
                 type: type,
                 serviceType: .Biller,
                 items: items.map({ $0.toEntity() }))
            
        default:
            return nil;
        }
    }
    
    
}


