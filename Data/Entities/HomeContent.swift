//
//  HomeContent.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 21/10/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation

protocol HomeContent {
    
    var id : Int { get set }
    var title : String { get set }
    var subtitle : String { get set }
    var priorityOrder : Int { get set }
    var type : ContentType { get set }
}
