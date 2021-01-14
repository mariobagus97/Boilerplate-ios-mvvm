//
//  HomeItemCell.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 23/10/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class HomeItemCell : UICollectionViewCell {
    
    static let Id : String = String(describing: HomeItemCell.self)
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    func initialize(item: HomeItem) {
        
        imgIcon.kf.setImage(with: URL(string: item.image ?? ""))
        lblName.text = item.name
    }
    
}
