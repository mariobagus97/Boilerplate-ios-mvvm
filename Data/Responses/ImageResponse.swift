//
//  ImageResponse.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 28/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import ObjectMapper

struct ImageResponse : Codable {
    
    var idMasterImage : Int?
    var idMasterImageable : Int?
    var url : String?
}
