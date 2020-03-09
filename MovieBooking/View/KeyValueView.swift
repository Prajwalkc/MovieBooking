//
//  KeyValueView.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

class KeyValueView: UIView {
    
    var headerTitle = UILabel()
    var containerView = UIView()
    var headerSubTitle = UILabel()
    
    var priceTitle = UILabel()
    var priceSubTitle = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(model: BottomFooterViewModel?) {
        self.headerTitle.text = "Total Seats"
        self.headerSubTitle.text = "\(model?.totalSeatNumber ?? "") seats selected"
        
        self.priceTitle.text = "Total Price"
        self.priceSubTitle.text = model?.totalPrice
    }
    
    private func setupView() {
        containerView.setupForAutolayout(in: self)
        containerView.pin(left: 0, right: 0, top: 0, bottom: 0, toView: self)
        
        headerTitle.setupForAutolayout(in: self)
        headerSubTitle.setupForAutolayout(in: self)
        
        priceTitle.setupForAutolayout(in: self)
        priceSubTitle.setupForAutolayout(in: self)
        
        headerTitle.pinLeadingToLeading(of: self, constant: 8)
        headerTitle.pinTopToTop(of: self, constant: 8)
        headerTitle.font = Theme.Font.regular14
        headerTitle.textColor = Theme.Color.secondaryText
        headerTitle.adjustsFontSizeToFitWidth = true
        headerTitle.minimumScaleFactor = 0.8
        headerTitle.textAlignment = .left
        
        headerSubTitle.font = Theme.Font.semibold16
        headerSubTitle.textColor = Theme.Color.primaryText
        headerSubTitle.adjustsFontSizeToFitWidth = true
        headerSubTitle.minimumScaleFactor = 0.8
        headerSubTitle.textAlignment = .left
        
        priceTitle.pinLeadingToTrailing(of: headerTitle, constant: 8)
        priceTitle.pinTrailingToTrailing(of: self, constant: 8)
        priceTitle.pinTopToTop(of: self, constant: 8)
        priceTitle.pinEqualWidth(to: headerTitle)
        priceTitle.font = Theme.Font.regular14
        priceTitle.textColor = Theme.Color.secondaryText
        priceTitle.adjustsFontSizeToFitWidth = true
        priceTitle.minimumScaleFactor = 0.8
        priceTitle.textAlignment = .right
        
        priceSubTitle.font = Theme.Font.semibold16
        priceSubTitle.textColor = Theme.Color.mintGreenColor
        priceSubTitle.adjustsFontSizeToFitWidth = true
        priceSubTitle.minimumScaleFactor = 0.8
        priceSubTitle.textAlignment = .right
        
        
        headerSubTitle.pinLeadingToLeading(of: headerTitle, constant: 0)
        headerSubTitle.pinTrailingToTrailing(of: headerTitle, constant: 0)
        headerSubTitle.pinTopToBottom(of: headerTitle, constant: 4)
        
        priceSubTitle.pinLeadingToLeading(of: priceTitle, constant: 0)
        priceSubTitle.pinTrailingToTrailing(of: priceTitle, constant: 0)
        priceSubTitle.pinTopToBottom(of: priceTitle, constant: 4)
        
    }
}

