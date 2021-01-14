//
//  HomeContentCell.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 23/10/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeContentCell : UITableViewCell {
    
    let disposeBag : DisposeBag = DisposeBag()
    
    static let Id : String = "HomeContentCell"
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var collectionViewHomeItems: UICollectionView!
    
    @IBOutlet weak var collectionViewHomeItemsHeight: NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func initialize(item: ProductContent, tableView : UITableView) {

        if(item.type != .Voucher && item.type != .Biller){
            return
        }
        
        let itemHeight : Double = 80;

        lblTitle.text = item.title
        lblSubtitle.text = item.subtitle
        let a = BehaviorSubject<[HomeItem]>(value: item.items)
        a.asObservable().bind(to: collectionViewHomeItems.rx.items(cellIdentifier: HomeItemCell.Id, cellType: HomeItemCell.self)) { (row,item,cell) in
            cell.initialize(item: item)
        }.disposed(by: disposeBag)

        let collectionWidth = tableView.bounds.width - 40;
        let voucherRow = ceil(Double(item.items.count) / 5.0)
        
        var layout = collectionViewHomeItems.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: Double(collectionWidth / 5), height: itemHeight)
        collectionViewHomeItems.collectionViewLayout = layout
        collectionViewHomeItemsHeight.constant = CGFloat(voucherRow * itemHeight)
        
    }
    
}
