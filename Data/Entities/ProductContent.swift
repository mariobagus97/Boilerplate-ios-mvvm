//
//  ProductContent.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 23/10/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation

struct ProductContent : HomeContent {
    
    var id: Int
    var title: String
    var subtitle: String
    var priorityOrder: Int
    var type: ContentType
    
    var serviceType : ServiceType
    var items : [HomeItem]
}
