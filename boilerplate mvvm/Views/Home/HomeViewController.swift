//
//  HomeViewController.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 28/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController : BaseViewController<HomeViewModel> {
    
    @IBOutlet weak var viewUltraValue: UIView!
    @IBOutlet weak var viewPoint: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewUnauthorized: UIView!
    @IBOutlet weak var viewHomeBanner: UIView!
    @IBOutlet weak var tableViewHomeBanner: UICollectionView!
    @IBOutlet weak var tableViewHomeContents: UITableView!
    @IBOutlet weak var tableViewHomeContentsHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewHomeContents.rowHeight = UITableView.automaticDimension
        
        viewModel.homeContents.bind(to: tableViewHomeContents.rx.items(cellIdentifier: HomeContentCell.Id, cellType: HomeContentCell.self)) { (row,item,cell) in
            cell.initialize(item: item, tableView: self.tableViewHomeContents)
        }.disposed(by: disposeBag)
        
        viewModel.getCategory(onComplete: {
            self.tableViewHomeContentsHeight.constant = self.tableViewHomeContents.getActualHeight();
        })
        
        viewModel.homeContents.value.count
        
        viewModel.homeContents
            .asObservable()
            .map({ $0.count })
            .subscribe( onNext: { count in
                self.tableViewHomeContents.isHidden = (count == 0)
            })
            
        
        
    }
    
}
