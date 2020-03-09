//
//  UIView+Extensions.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addCornerRadius(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setupForAutolayout(in view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
    }
    
    func pinTrailingToTrailing(of view: UIView, constant: CGFloat) {
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
    }
    
    func pinTrailingToLeading(of view: UIView, constant: CGFloat) {
        self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    func pinTopToTopSafeArea(of view: UIView, constant: CGFloat) {
        
        if #available(iOS 11.0, *) {
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
        } else {
            self.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: constant).isActive = true
        }
    }
    
    func pinTopToTop(of view: UIView, constant: CGFloat) {
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    func pinTopToBottom(of view: UIView, constant: CGFloat) {
        self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }
    
    func pinLeadingToLeading(of view: UIView, constant: CGFloat) {
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    func pinLeadingToTrailing(of view: UIView, constant: CGFloat) {
        self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true
    }
    
    func pinBottomToBottom(of view: UIView, constant: CGFloat) {
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
    }
    
    func pinBottomToBottomSafeArea(of view: UIView, constant: CGFloat) {
        
        if #available(iOS 11.0, *) {
            self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -constant).isActive = true
        }
    }
    
    func pinBottomToTop(of view: UIView, constant: CGFloat) {
        self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    func pinEqualHeight(to view: UIView) {
        self.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0).isActive = true
    }
    
    func pinEqualWidth(to view: UIView) {
        self.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
    }
    
    func pinHeight(constant: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func pinHeightProportional(to view: UIView, multiplier: CGFloat) {
        self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier, constant: 0).isActive = true
    }
    
    func pinWidth(constant: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func pinToCenterHorizontally(in view: UIView, constant: CGFloat = 0) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    
    func pinToCenterVertically(in view: UIView, constant: CGFloat = 0) {
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    func pin(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat, toView view:UIView) {
        
        self.pinLeadingToLeading(of: view, constant: left)
        self.pinTrailingToTrailing(of: view, constant: right)
        self.pinTopToTop(of: view, constant: top)
        self.pinBottomToBottom(of: view, constant: bottom)
    }
}
