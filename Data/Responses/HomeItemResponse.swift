//
//  HomeItemResponse.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 28/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation

struct HomeItemResponse : Codable  {
    
    let id : Int
    let image : ImageResponse?
    let code : String?
    let name : String?
    let status : Status?
    
    func toEntity() -> HomeItem {
        
        return HomeItem(id: id, image: image?.url, code: code, name: name, status: status)
        
    }
    
}

