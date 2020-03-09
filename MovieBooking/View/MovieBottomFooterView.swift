//
//  BottomFooterView.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

class MovieBottomFooterView: ShadowView {
    
    var totalSeatTitleLabel = UILabel()
    var selectedTotalSeat = UILabel()
    
    var containerView = UIView()
    var keyValueView = KeyValueView()
    
    var onProceedButtonTapped: (()->())?
    
    var proceedButton = UIButton()
    
    var totalSeats: String? {
        didSet {
            self.selectedTotalSeat.text = totalSeats
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        //        setupViewNew()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        //    setupViewNew()
    }
    
    func setupViewNew() {
        containerView.setupForAutolayout(in: self)
        containerView.pin(left: 0, right: 0, top: 0, bottom: 0, toView: self)
        
        proceedButton.setupForAutolayout(in: containerView)
        proceedButton.pinTrailingToTrailing(of: containerView, constant: 0)
        proceedButton.pinTopToTop(of: containerView, constant: 0)
        proceedButton.pinBottomToBottom(of: containerView, constant: 0)
        proceedButton.pinWidth(constant: 150)
        proceedButton.backgroundColor = Theme.Color.mintGreenColor
        proceedButton.addTarget(self, action: #selector(bookNowButtonTapped), for: .touchUpInside)
        
        keyValueView.setupForAutolayout(in: containerView)
        keyValueView.pinTrailingToLeading(of: proceedButton, constant: 0)
        keyValueView.pinTopToTop(of: containerView, constant: 0)
        keyValueView.pinBottomToBottom(of: containerView, constant: 0)
        keyValueView.pinLeadingToLeading(of: containerView, constant: 8)
        
        keyValueView.headerTitle.text = "Seats"
        keyValueView.headerSubTitle.text = ""
        
        keyValueView.priceTitle.text = "Total Price"
        keyValueView.priceSubTitle.text = "NPR 3000"
    }
    
    func setupView() {
        
        containerView.setupForAutolayout(in: self)
        containerView.pin(left: 0, right: 0, top: 0, bottom: 0, toView: self)
        
        totalSeatTitleLabel.setupForAutolayout(in: containerView)
        totalSeatTitleLabel.pinLeadingToLeading(of: containerView, constant: 16)
        totalSeatTitleLabel.pinTopToTop(of: containerView, constant: 8)
        totalSeatTitleLabel.font = Theme.Font.semibold16
        totalSeatTitleLabel.textColor = Theme.Color.secondaryText
        totalSeatTitleLabel.textAlignment = .left
        totalSeatTitleLabel.text = "Total Seat"
        
        selectedTotalSeat.setupForAutolayout(in: containerView)
        selectedTotalSeat.pinLeadingToLeading(of: totalSeatTitleLabel, constant: 0)
        selectedTotalSeat.pinTopToBottom(of: totalSeatTitleLabel, constant: 4)
        selectedTotalSeat.pinTrailingToTrailing(of: totalSeatTitleLabel, constant: 0)
        selectedTotalSeat.textAlignment = .left
        selectedTotalSeat.font = Theme.Font.semibold16
        selectedTotalSeat.textColor = Theme.Color.secondaryText
        selectedTotalSeat.text = "NPR 2000"
        selectedTotalSeat.numberOfLines = 0
        
        proceedButton.setupForAutolayout(in: containerView)
        proceedButton.pinLeadingToTrailing(of: totalSeatTitleLabel, constant: 16)
        proceedButton.pinTopToTop(of: containerView, constant: 0)
        proceedButton.pinBottomToBottom(of: containerView, constant: 0)
        proceedButton.pinTrailingToTrailing(of: containerView, constant: 0)
        proceedButton.pinWidth(constant: 150)
        proceedButton.backgroundColor = Theme.Color.mintGreenColor
        
        proceedButton.addTarget(self, action: #selector(bookNowButtonTapped), for: .touchUpInside)
        proceedButton.setTitle("Proceed", for: .normal)
        proceedButton.titleLabel?.font = Theme.Font.semibold16
        
    }
    
    func updateView(model: BottomFooterViewModel?) {
        self.totalSeatTitleLabel.text = "Total Seats: \(model?.totalSeatNumber ?? "")"
        self.selectedTotalSeat.text = "Total Price : \(model?.totalPrice ?? "")"
    }
    
    @objc func bookNowButtonTapped() {
        onProceedButtonTapped?()
    }
}
