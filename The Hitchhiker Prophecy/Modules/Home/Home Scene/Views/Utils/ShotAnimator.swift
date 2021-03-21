//
//  ShotAnimator.swift
//  The Hitchhiker Prophecy
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class ShotAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var originalFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        100
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard
            let toView = transitionContext.view(forKey: .to),
            let detailsViewController = transitionContext.viewController(forKey: .to) as? CharacterDetailsSceneViewController,
            
            let characterNameLabel = detailsViewController.characterNameLabel,
            let characterDescriptionLabel = detailsViewController.characterDescriptionLabel
        else { return }
        
        let initFrame = originalFrame
        let finalFrame = toView.frame
        
        let initialScale = CGAffineTransform(
            scaleX: initFrame.width / finalFrame.width,
            y: initFrame.height / finalFrame.height
        )
        
        // set initial state of views
        toView.center = CGPoint(x: initFrame.midX, y: initFrame.midY)
        toView.transform = initialScale
        [characterNameLabel, characterDescriptionLabel].forEach({$0.alpha = 0})
        
        containerView.addSubview(toView)
        
        // animate views to final state
        UIView.animate(withDuration: 0.2) {
            toView.transform = .identity
            toView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        } completion: { (_) in
            transitionContext.completeTransition(true)
            UIView.animate(withDuration: 0.2) {
                [characterNameLabel, characterDescriptionLabel].forEach({$0.alpha = 1})
            }
        }
        
    }
    
    
}
