//
//  LoadingViewController.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 03/09/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import UIKit

class LoadingViewController : BaseViewController<BaseViewModel>, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
        
        self.modalPresentationStyle = .overCurrentContext
        self.transitioningDelegate = ModalTransitioningDelegate()
        
        let touchableView = UIView(frame: self.view.frame)
        view.insertSubview(touchableView, at: 0)
        
        touchableView.addGestureRecognizer(tapGesture);
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    @objc func tapGestureHandler(sender: UIPanGestureRecognizer) {
        self.dismiss()
    }
    
    func dismiss() {
        self.dismiss(animated: false, completion: nil)
    }
    
}
