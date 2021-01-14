//
//  Errors.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 04/09/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation

enum GeneralError : Error {
    case storyboardNameNotFound
    
    var msg : String {
        switch self {
        case .storyboardNameNotFound:
            return "StoryboardName cannot be nil."
        default:
           return "GeneralError"
        }
    }
}
