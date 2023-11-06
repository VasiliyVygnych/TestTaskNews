//
//  PresentViewController.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

class PresentViewController: NSObject,
                             UIViewControllerAnimatedTransitioning {
    enum TransitionMode {
        case present
        case dismiss
    }
    private let transitionMode: TransitionMode
    private let duration: CGFloat
    private let startingAnimation: CGPoint
    
    init(transitionMode: TransitionMode,
         duration: CGFloat,
         startingAnimation: CGPoint) {
        self.transitionMode = transitionMode
        self.duration = duration
        self.startingAnimation = startingAnimation
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        self.duration
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let conteinerView = transitionContext.containerView
        switch self.transitionMode {
        case .present:
            guard let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
                transitionContext.completeTransition(false)
                return
            }
            let viewCenter = presentedView.center
            presentedView.center = self.startingAnimation
            presentedView.transform = CGAffineTransform(scaleX: 0.8,
                                                        y: 0.5)
            conteinerView.addSubview(presentedView)
            UIView.animate(withDuration: self.duration) {
                presentedView.center = viewCenter
                presentedView.transform = CGAffineTransform.identity
                presentedView.backgroundColor = .black
                presentedView.layer.cornerRadius = 40
            } completion: { finished in
                transitionContext.completeTransition(finished)
            }
        case .dismiss:
            guard let dismissedView = transitionContext.view(forKey: UITransitionContextViewKey.from) else {
                transitionContext.completeTransition(false)
                return
            }
            conteinerView.addSubview(dismissedView)
            UIView.animate(withDuration: self.duration) {
                dismissedView.center = self.startingAnimation
                dismissedView.backgroundColor = .white
                dismissedView.alpha = 0.0
                dismissedView.layer.cornerRadius = 0
            } completion: { finished in
                dismissedView.removeFromSuperview()
                transitionContext.completeTransition(finished)
            }
        }
    }
}
