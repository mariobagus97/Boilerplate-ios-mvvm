//
//  modalTransitioningDelegate.swift
//  boilerplate mvvm
//
//  Created by Aditya Haryanov on 03/09/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import UIKit

class ModalTransitioningDelegate : NSObject, UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animation = ModalAnimator(isDismiss: false)
        animation.appearedPoint = Float(source.view.frame.height / 3)
        
        return animation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animation = ModalAnimator(isDismiss: true)
        
        return animation
    }
}

class ModalAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    let bgOpacity:CGFloat = 0.3
    
    var isDismiss:Bool
    var appearedPoint:Float = 0

    init(isDismiss:Bool) {
        self.isDismiss = isDismiss
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        var isAnimationCompleted = false
        
        if isDismiss {
            
            let from = transitionContext.viewController(forKey: .from)
            let fromView = from?.view
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                fromView?.backgroundColor = UIColor.black.withAlphaComponent(0)
            },completion: { isCompleted in
                isAnimationCompleted = isCompleted
            })
            
            fromView?.removeFromSuperview()
            
        } else {
            
            let to = transitionContext.viewController(forKey: .to)
            let toView = to?.view

            toView?.backgroundColor = UIColor.black.withAlphaComponent(0)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                toView?.backgroundColor = UIColor.black.withAlphaComponent(self.bgOpacity)
            },completion: { isCompleted in
               isAnimationCompleted = isCompleted
            })
            
        }
        
        transitionContext.completeTransition(isAnimationCompleted)
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    
}


