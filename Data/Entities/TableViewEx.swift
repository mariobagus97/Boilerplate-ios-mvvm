//
//  TableViewEx.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 23/10/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func getActualHeight() -> CGFloat {
        var frame = self.frame;
        frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: 10000.0);
        self.frame = frame;

        UIView.setAnimationsEnabled(false)
        self.reloadData();
        UIView.setAnimationsEnabled(true)

        let heights = self.visibleCells.map({ $0.frame.height }).reduce(0, +)

        return heights;
    }
    
}
