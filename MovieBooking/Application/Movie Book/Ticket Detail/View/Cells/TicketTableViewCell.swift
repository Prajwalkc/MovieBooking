//
//  TicketTableViewCell.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit


class TicketTableViewCell: UITableViewCell {
    
    var colorLineView = UIView()
    var seperatorView = UIImageView()
    var movieNameKeyLabel = UILabel()
    var movieNameValueLabel = UILabel()
    var seatNoKeyLabel = UILabel()
    var seatNoValueLabel = UILabel()
    var dateKeyLabel = UILabel()
    var dateValueLabel = UILabel()
    var priceKeyLabel = UILabel()
    var priceValueLabel = UILabel()
    
    var containerView = TicketView()
    
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
        
        self.contentView.backgroundColor = Theme.Color.secondaryBackgroundColor
        
        containerView.setupForAutolayout(in: self.contentView)
        containerView.pin(left: 16, right: 16, top: 8, bottom: 8, toView: self.contentView)
        containerView.addCornerRadius(radius: 12)
        containerView.backgroundColor = .white
        movieNameKeyLabel.setupForAutolayout(in: self.contentView)
        movieNameKeyLabel.pinLeadingToLeading(of: self.containerView, constant: 16)
        movieNameKeyLabel.pinTopToTop(of: self.containerView, constant: 16)
        movieNameKeyLabel.text = "Movie Name"
        movieNameKeyLabel.trailingAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        movieNameKeyLabel.font = Theme.Font.regular14
        movieNameKeyLabel.textColor = Theme.Color.secondaryText
        
        movieNameValueLabel.setupForAutolayout(in: self.contentView)
        movieNameValueLabel.pinLeadingToLeading(of: movieNameKeyLabel, constant: 0)
        movieNameValueLabel.pinTopToBottom(of: movieNameKeyLabel, constant: 8)
        movieNameValueLabel.pinTrailingToTrailing(of: movieNameKeyLabel, constant: 0)
        movieNameValueLabel.text = "Iron Man"
        movieNameValueLabel.numberOfLines = 2
        movieNameValueLabel.textColor = Theme.Color.primaryText
        movieNameValueLabel.font = Theme.Font.semibold16
        
        dateKeyLabel.setupForAutolayout(in: self.contentView)
        dateKeyLabel.pinLeadingToLeading(of: movieNameValueLabel, constant: 0)
        dateKeyLabel.pinTopToBottom(of: movieNameValueLabel, constant: 16)
        dateKeyLabel.pinTrailingToTrailing(of: movieNameKeyLabel, constant: 0)
        dateKeyLabel.text = "Date"
        dateKeyLabel.font = Theme.Font.regular14
        dateKeyLabel.textColor = Theme.Color.secondaryText
        
        dateValueLabel.setupForAutolayout(in: self.contentView)
        dateValueLabel.pinLeadingToLeading(of: movieNameKeyLabel, constant: 0)
        dateValueLabel.pinTopToBottom(of: dateKeyLabel, constant: 8)
        dateValueLabel.pinBottomToBottom(of: self.containerView, constant: 8)
        dateValueLabel.pinTrailingToTrailing(of: movieNameKeyLabel, constant: 0)
        dateValueLabel.text = "27 Nov, 2019"
        dateValueLabel.numberOfLines = 2
        dateValueLabel.font = Theme.Font.semibold16
        dateValueLabel.textColor = Theme.Color.primaryText
    
        
        seatNoKeyLabel.setupForAutolayout(in: self.contentView)
        seatNoKeyLabel.pinTrailingToTrailing(of: self.containerView, constant: 16)
        seatNoKeyLabel.pinToCenterVertically(in: movieNameKeyLabel)
        seatNoKeyLabel.text = "Seat No"
        seatNoKeyLabel.font = Theme.Font.regular14
        seatNoKeyLabel.textColor = Theme.Color.secondaryText
        seatNoKeyLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 32).isActive = true
        seatNoKeyLabel.textAlignment = .right
        
        seatNoValueLabel.setupForAutolayout(in: self.contentView)
        seatNoValueLabel.pinLeadingToLeading(of: seatNoKeyLabel, constant: 0)
        seatNoValueLabel.pinTopToBottom(of: seatNoKeyLabel, constant: 8)
        seatNoValueLabel.pinTrailingToTrailing(of: seatNoKeyLabel, constant: 0)
        seatNoValueLabel.font = Theme.Font.semibold16
        seatNoValueLabel.textColor = Theme.Color.primaryText
        seatNoValueLabel.numberOfLines = 2
        seatNoValueLabel.textAlignment = .right
        seatNoValueLabel.text = "22"
        
        priceKeyLabel.setupForAutolayout(in: self.contentView)
        priceKeyLabel.pinLeadingToLeading(of: seatNoValueLabel, constant: 0)
        priceKeyLabel.pinTopToBottom(of: seatNoValueLabel, constant: 16)
        priceKeyLabel.pinTrailingToTrailing(of: seatNoKeyLabel, constant: 0)
        priceKeyLabel.pinToCenterVertically(in: dateKeyLabel)
        priceKeyLabel.text = "Price"
        priceKeyLabel.font = Theme.Font.regular14
        priceKeyLabel.textColor = Theme.Color.secondaryText
        priceKeyLabel.textAlignment = .right
        
        priceValueLabel.setupForAutolayout(in: self.contentView)
        priceValueLabel.pinLeadingToLeading(of: seatNoKeyLabel, constant: 0)
        priceValueLabel.pinTopToBottom(of: priceKeyLabel, constant: 8)
        priceValueLabel.pinBottomToBottom(of: self.containerView, constant: 8)
        priceValueLabel.pinTrailingToTrailing(of: priceKeyLabel, constant: 0)
        priceValueLabel.font = Theme.Font.semibold16
        priceValueLabel.textColor = Theme.Color.mintGreenColor
        priceValueLabel.numberOfLines = 2
        priceValueLabel.textAlignment = .right
        priceValueLabel.text = "NPR 200"
        
        colorLineView.setupForAutolayout(in: self.contentView)
        colorLineView.pinLeadingToLeading(of: self.containerView, constant: 0)
        colorLineView.pinTopToTop(of: movieNameKeyLabel, constant: 0)
        colorLineView.pinBottomToBottom(of: movieNameValueLabel, constant: 0)
        colorLineView.pinWidth(constant: 3)
        colorLineView.backgroundColor = Theme.Color.mintGreenColor
    }
    
    func updateTicketView(model: TicketDetailViewModel) {
        
        self.priceValueLabel.text = "NPR \(model.moviePrice ?? "")"
        self.dateValueLabel.text = model.movieDate
        self.movieNameValueLabel.text = model.movieName
        self.seatNoValueLabel.text = model.movieTicketNumber
        
    }
}
