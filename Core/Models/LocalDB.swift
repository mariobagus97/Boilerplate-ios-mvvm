//
//  LocalDB.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 26/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import RealmSwift

class LocalDB {
    
    //    var tokenLogin = try! Realm().objects(TokenLogin.self)
    
    func AddToken(token : String) {
        let realm = try! Realm() // 1
        var sessionLogin = try! Realm().objects(SessionLogin.self) //try! Realm().objects(TokenLogin.self)
        
        //        for token in tokenLogin{
        //            print(token.token)
        //        }
        if let sessionLogin = sessionLogin.first {
            try! realm.write {
                sessionLogin.token = token
            }
        }
        else {
            try! realm.write { // 2
                let sessionLogin = SessionLogin() // 3
                sessionLogin.token = token
                realm.add(sessionLogin) // 5
            }
        }
        
    }
}
