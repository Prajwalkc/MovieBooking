//
//  MovieSeatView.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

enum SeatType {
     case selected
     case notAvailable
     case available
     case title
     case purchased
     case cancelled
     case booked
 }

class MovieSeatView: UIView {
    
    var onSeatSelection: ((SeatInfoModel?)->())?
    var onSeatUnSelection: ((SeatInfoModel?)->())?
    var seatModel: SeatInfoModel?
    
    var containerView = UIView()
    var titleView = UIView()
    var subTitleView = UIView()
    
    var containerViewButton = UIButton()
    var seatLabel = UILabel()
    var seatType: SeatType = .available {
        didSet {
            updateSeatType(seatType: seatType)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        containerView.setupForAutolayout(in: self)
        containerView.pin(left: 0, right: 0, top: 0, bottom: 0, toView: self)
        
        titleView.backgroundColor = .lightGray
        titleView.setupForAutolayout(in: containerView)
        titleView.pinLeadingToLeading(of: containerView, constant: 0)
        titleView.pinTrailingToTrailing(of: containerView, constant: 0)
        titleView.pinTopToTop(of: containerView, constant: 0)
        titleView.addCornerRadius(radius: 8)
        
        seatLabel.setupForAutolayout(in: titleView)
        seatLabel.pin(left: 4, right: 4, top: 0, bottom: 0, toView: titleView)
        
        subTitleView.backgroundColor = .lightGray
        subTitleView.setupForAutolayout(in: containerView)
        subTitleView.pinTopToBottom(of: titleView, constant: 2)
        subTitleView.pinLeadingToLeading(of: titleView, constant: 8)
        subTitleView.pinTrailingToTrailing(of: titleView, constant: 8)
        subTitleView.pinBottomToBottom(of: containerView, constant: 8)
        subTitleView.pinHeightProportional(to: titleView, multiplier: 0.2)
        subTitleView.addCornerRadius(radius: 4)
        
        seatLabel.textAlignment = .center
        seatLabel.minimumScaleFactor = 0.8
        seatLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        containerViewButton.setupForAutolayout(in: containerView)
        containerViewButton.pin(left: 0, right: 0, top: 0, bottom: 0, toView: containerView)
        containerViewButton.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
    }
    
    func configureView(model: SeatInfoModel) {
        self.seatModel = model
        if model.seatNo == "0" {
            self.isHidden = true
        }
        
        switch model.seatStatus ?? 0 {
        case 3:
            updateSeatType(seatType: .notAvailable)
        case 1:
            updateSeatType(seatType: .purchased)
        case 2:
            updateSeatType(seatType: .booked)
        default:
            updateSeatType(seatType: .available)
        }
    }
    
    @objc func onButtonTapped(_ sender: AnyObject) {
        
        guard let button = sender as? UIButton else { return }
        
        if !button.isSelected {
            button.isSelected = true
            self.seatType = .selected
            onSeatSelection?(seatModel)
        }
        else {
            button.isSelected = false
            self.seatType = .available
            onSeatUnSelection?(seatModel)
        }
    }
    
    private func updateSeatType(seatType: SeatType) {
        switch seatType {
        case .available:
            setupViewForAvailable()
        case .notAvailable:
            setupViewForUnAvailable()
        case .selected:
            setupViewForSelected()
        case .title:
            setupTitleViewForSeat()
        case .purchased:
            setupViewForPurchased()
        case .cancelled:
            setupViewForUnAvailable()
        case .booked:
            setupViewForBooked()
        }
    }
    
    private func setupViewForBooked() {
        subTitleView.backgroundColor = .darkGray
        titleView.backgroundColor = .darkGray
        seatLabel.textColor = .white
        containerViewButton.isUserInteractionEnabled = false
    }
    private func setupViewForPurchased() {
        subTitleView.backgroundColor = Theme.Color.amountRedColor
        seatLabel.textColor = .white
        titleView.backgroundColor = Theme.Color.amountRedColor
        containerViewButton.isUserInteractionEnabled = false
    }
    
    private func setupTitleViewForSeat() {
        containerView.backgroundColor = .clear
        seatLabel.textColor = Theme.Color.secondaryText
        seatLabel.font = Theme.Font.semibold16
        titleView.backgroundColor = .clear
        subTitleView.backgroundColor = .clear
        self.containerViewButton.isUserInteractionEnabled = false
    }
    private func setupViewForSelected() {
        subTitleView.backgroundColor = Theme.Color.mintGreenColor
        seatLabel.textColor = .white
        titleView.backgroundColor = Theme.Color.mintGreenColor
    }
    
    private func setupViewForAvailable() {
        subTitleView.backgroundColor = .lightGray
        titleView.backgroundColor = .lightGray
        seatLabel.textColor = .white
        self.containerViewButton.isUserInteractionEnabled = true
    }
    
    private func setupViewForUnAvailable() {
        subTitleView.backgroundColor = .black
        titleView.backgroundColor = .black
        seatLabel.textColor = .white
        self.containerViewButton.isUserInteractionEnabled = false
    }
}
