//
//  File.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 12/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation

struct LoginResponse : Codable {
    
    var id : Int?
    var referralCode : String?
    var primary_phone : String?
    var gender : String?
    var email : String?
    var firstName : String?
    var token : String?
    var isVerified : String?

}
