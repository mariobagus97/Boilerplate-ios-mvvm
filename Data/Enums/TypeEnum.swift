//
//  TypeEnum.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 04/09/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation

enum storyboardType : String {
    case prelogin = "Prelogin"
    case home = "Home"
    case voucherRedeem = "VoucherRedeem"
    case none = "None"
}

enum ContentType : String, Codable {
    
    case Voucher = "VOUCHER"
    case Biller = "BILLER"
    case NewMember
    case Regular
    case FlashSale
    case Highlight
}

enum ServiceType : String, Codable {
    case Voucher = "VOUCHER"
    case Biller = "BILLER"
}
