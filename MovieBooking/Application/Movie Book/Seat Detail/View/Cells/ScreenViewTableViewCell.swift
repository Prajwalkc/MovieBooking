//
//  ScreenViewTableViewCell.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

class ScreenViewTableViewCell: UITableViewCell {
    
    var containerView = ShadowView()
    var screenLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        containerView.setupForAutolayout(in: self.contentView)
        containerView.pin(left: 8, right: 8, top: 8, bottom: 8, toView: self.contentView)
        containerView.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        screenLabel.setupForAutolayout(in: containerView)
        containerView.addCornerRadius(radius: 8)
        screenLabel.pin(left: 8, right: 8, top: 8, bottom: 8, toView: containerView)
        screenLabel.textAlignment = .center
        screenLabel.font = Theme.Font.semibold24
        screenLabel.text = "SCREEN"
    }
}
