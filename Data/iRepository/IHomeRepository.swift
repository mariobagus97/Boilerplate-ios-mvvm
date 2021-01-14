//
//  IHomeRepository.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 28/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import RxSwift

protocol IHomeRepository {
    func getListCategory() -> Single<[ProductContent]>
}
