//
//  RequestHeader.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 12/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation

protocol RequestHeader {
    func getDevicToken() -> String
    func getFcmToken() -> String
    func getDeviceVersion() -> String
    func getDeviceName() -> String
    func getDeviceLang() -> String
    func getDeviceUtcOffset() -> String
}

class RequestHeaderImpl: RequestHeader {
    
    init() {
        
    }
    
    func getDevicToken() -> String {
        "aaaa"
    }
    
    func getFcmToken() -> String {
        "aaaa"
    }
    
    func getDeviceVersion() -> String {
        "var device =  .current.systemVersio"
    }
    
    func getDeviceName() -> String {
        ""
    }
    
    func getDeviceLang() -> String {
        ""
    }
    
    func getDeviceUtcOffset() -> String {
        "+0700"
    }
    

}
