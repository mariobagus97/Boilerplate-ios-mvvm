//
// Created by Ultra Voucher on 07/08/20.
// Copyright (c) 2020 ryomar. All rights reserved.
//

import Foundation
import ObjectMapper

struct BaseResponse<T> : Codable where T: Codable {
    
    var meta : MetaResponse
    var data : T
}

struct BaseResponseArrayData<T> : Codable where T: Codable {
    var meta : MetaResponse
    var data : [T]
}

struct MetaResponse : Codable {
    
    var code : String
    var status : String
    var message : String
}

struct ErrorItemResponse : Codable {
    var code : String
    var status : String
    var message : String

}

struct ErrorResponse : Codable {
    var errors : [ErrorItemResponse]
}

struct RuntimeError: Error {
    let message: String

    init(_ message: String) {
        self.message = message
    }

    public var localizedDescription: String {
        return message
    }
}
