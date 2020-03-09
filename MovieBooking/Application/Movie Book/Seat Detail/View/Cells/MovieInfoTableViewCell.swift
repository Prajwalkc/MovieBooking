//
//  MovieInfoTableViewCell.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

class MovieSeatInfoTableViewCell: UITableViewCell {
    
    let availableboxView = UIView()
    let availableLabel = UILabel()
    let availableBottomBoxView = UIView()
    
    let reservedBoxView = UIView()
    let reservedLabel = UILabel()
    let reservedBottomBoxView = UIView()
    
    let soldBoxView = UIView()
    let soldLabel = UILabel()
    let soldBottomBoxView = UIView()
    
    let selectedBoxView = UIView()
    let selectedLabel = UILabel()
    let selectedBottomBoxView = UIView()
    
    let containerView = ShadowView()
    
    let mainContainerView = UIView()
    
    let titleLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
       
        mainContainerView.setupForAutolayout(in: self.contentView)
       
        mainContainerView.pin(left: 0, right: 0, top: 0, bottom: 16, toView: self)
        self.contentView.backgroundColor = Theme.Color.secondaryBackgroundColor
        
        titleLabel.setupForAutolayout(in: self.contentView)
        
        titleLabel.pinLeadingToLeading(of: mainContainerView, constant: 8)
        titleLabel.pinTopToTop(of: mainContainerView, constant: 8)
        titleLabel.pinTrailingToTrailing(of: mainContainerView, constant: 8)
        titleLabel.textAlignment = .left
        titleLabel.textColor = Theme.Color.secondaryText
        titleLabel.font = Theme.Font.semibold16
        titleLabel.text = "SEAT TYPE"
        
        containerView.setupForAutolayout(in: self.contentView)
        
        containerView.pinLeadingToLeading(of: mainContainerView, constant: 8)
        containerView.pinTopToBottom(of: titleLabel, constant: 8)
        containerView.pinTrailingToTrailing(of: mainContainerView, constant: 8)
        containerView.pinBottomToBottom(of: mainContainerView, constant: 8)
        containerView.addCornerRadius(radius: 12)
        containerView.backgroundColor = .white
//        containerView.layer.borderWidth = 2
//        containerView.layer.borderColor = UIColor.darkGray.cgColor

        
        availableLabel.setupForAutolayout(in: self.contentView)
        availableLabel.text = "Available"
        availableLabel.font = Theme.Font.semibold16
        availableLabel.textColor = Theme.Color.secondaryText
                
        reservedLabel.setupForAutolayout(in: self.contentView)
        reservedLabel.text = "Reserved"
        reservedLabel.font = Theme.Font.semibold16
        reservedLabel.textColor = Theme.Color.secondaryText
       
        reservedBoxView.setupForAutolayout(in: self.contentView)
        reservedBoxView.addCornerRadius(radius: 8)
        
        selectedLabel.setupForAutolayout(in: self.contentView)
        selectedLabel.text = "Selected"
        selectedLabel.font = Theme.Font.semibold16
        selectedLabel.textColor = Theme.Color.secondaryText
       
        selectedBoxView.setupForAutolayout(in: self.contentView)
        selectedBoxView.addCornerRadius(radius: 8)
        
        soldLabel.setupForAutolayout(in: self.contentView)
        soldLabel.text = "Sold"
        soldLabel.font = Theme.Font.semibold16
        soldLabel.textColor = Theme.Color.secondaryText
        
        soldBoxView.setupForAutolayout(in: self.contentView)
        soldBoxView.addCornerRadius(radius: 8)
        
        availableboxView.setupForAutolayout(in: self.contentView)
        availableboxView.pinLeadingToLeading(of: containerView, constant: 16)
        availableboxView.pinTopToTop(of: containerView, constant: 8)
        availableboxView.pinWidth(constant: 40)
        availableboxView.pinHeight(constant: 30)
        availableboxView.addCornerRadius(radius: 8)
        availableboxView.backgroundColor = .lightGray
        
        availableBottomBoxView.setupForAutolayout(in: containerView)
        availableBottomBoxView.pinTopToBottom(of: availableboxView, constant: 4)
        availableBottomBoxView.pinLeadingToLeading(of: availableboxView, constant: 8)
        availableBottomBoxView.pinHeightProportional(to: availableboxView, multiplier: 0.2)
        availableBottomBoxView.pinTrailingToTrailing(of: availableboxView, constant: 8)
        availableBottomBoxView.backgroundColor = .lightGray
        availableBottomBoxView.addCornerRadius(radius: 4)
        
        availableLabel.pinLeadingToTrailing(of: availableboxView, constant: 8)
        availableLabel.pinTopToTop(of: availableboxView, constant: 0)
        availableLabel.pinBottomToBottom(of: availableboxView, constant: 0)
        
        reservedBoxView.pinLeadingToTrailing(of: availableLabel, constant: 24)
        reservedBoxView.pinTopToTop(of: availableboxView, constant: 0)
        reservedBoxView.pinEqualHeight(to: availableboxView)
        reservedBoxView.pinEqualWidth(to: availableboxView)
        reservedBoxView.backgroundColor = .darkGray
        
        reservedBottomBoxView.setupForAutolayout(in: containerView)
        reservedBottomBoxView.pinTopToBottom(of: reservedBoxView, constant: 4)
        reservedBottomBoxView.pinLeadingToLeading(of: reservedBoxView, constant: 8)
        reservedBottomBoxView.pinHeightProportional(to: reservedBoxView, multiplier: 0.2)
        reservedBottomBoxView.pinTrailingToTrailing(of: reservedBoxView, constant: 8)
        reservedBottomBoxView.backgroundColor = .darkGray
        reservedBottomBoxView.addCornerRadius(radius: 4)
        
        reservedLabel.pinLeadingToTrailing(of: reservedBoxView, constant: 8)
        reservedLabel.pinTopToTop(of: reservedBoxView, constant: 0)
        reservedLabel.pinTrailingToTrailing(of: containerView, constant: 16)
        reservedLabel.pinBottomToBottom(of: reservedBottomBoxView, constant: 0)
        
        selectedBoxView.pinLeadingToLeading(of: availableboxView, constant: 0)
        selectedBoxView.pinTopToBottom(of: availableBottomBoxView, constant: 8)
        selectedBoxView.pinEqualWidth(to: availableboxView)
        selectedBoxView.pinEqualHeight(to: availableboxView)
        selectedBoxView.backgroundColor = Theme.Color.mintGreenColor
        
        selectedBottomBoxView.setupForAutolayout(in: containerView)
        selectedBottomBoxView.pinTopToBottom(of: selectedBoxView, constant: 4)
        selectedBottomBoxView.pinLeadingToLeading(of: selectedBoxView, constant: 8)
        selectedBottomBoxView.pinHeightProportional(to: selectedBoxView, multiplier: 0.2)
        selectedBottomBoxView.pinTrailingToTrailing(of: selectedBoxView, constant: 8)
        selectedBottomBoxView.backgroundColor = Theme.Color.mintGreenColor
        selectedBottomBoxView.addCornerRadius(radius: 4)
        selectedBottomBoxView.pinBottomToBottom(of: containerView, constant: 8)
        
        selectedLabel.pinLeadingToTrailing(of: selectedBoxView, constant: 8)
        selectedLabel.pinTopToTop(of: selectedBoxView, constant: 0)
        selectedLabel.pinBottomToBottom(of: selectedBoxView, constant: 0)
        
        soldBoxView.pinLeadingToLeading(of: reservedBoxView, constant: 0)
        soldBoxView.pinTopToTop(of: selectedBoxView, constant: 0)
        soldBoxView.pinEqualHeight(to: selectedBoxView)
        soldBoxView.pinEqualWidth(to: selectedBoxView)
        soldBoxView.backgroundColor = Theme.Color.amountRedColor
        
        soldBottomBoxView.setupForAutolayout(in: containerView)
        soldBottomBoxView.pinTopToBottom(of: soldBoxView, constant: 4)
        soldBottomBoxView.pinLeadingToLeading(of: soldBoxView, constant: 8)
        soldBottomBoxView.pinHeightProportional(to: soldBoxView, multiplier: 0.2)
        soldBottomBoxView.pinTrailingToTrailing(of: soldBoxView, constant: 8)
        soldBottomBoxView.backgroundColor = Theme.Color.amountRedColor
        soldBottomBoxView.addCornerRadius(radius: 4)
        
        soldLabel.pinLeadingToTrailing(of: soldBoxView, constant: 8)
        soldLabel.pinTopToTop(of: soldBoxView, constant: 0)
        soldLabel.pinTrailingToTrailing(of: reservedLabel, constant: 0)
        soldLabel.pinBottomToBottom(of: selectedBottomBoxView, constant: 0)
    }
}
