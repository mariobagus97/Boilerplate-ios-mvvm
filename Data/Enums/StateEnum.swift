//
//  StateEnum.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 28/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation

enum Status : String, Codable {
    case Active = "ACTIVE"
    case Inactive = "INACTIVE"
    case Blocked = "BLOCKED"
    case Hidden = "HIDDEN"
    case Deleted = "DELETED"
}

