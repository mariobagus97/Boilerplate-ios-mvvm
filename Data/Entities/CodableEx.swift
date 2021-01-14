//
//  CodableEx.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 21/10/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation

protocol Response : Decodable {
    
    func toEntity() -> Any
}
