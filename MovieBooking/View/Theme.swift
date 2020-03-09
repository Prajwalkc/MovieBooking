//
//  Theme.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    struct Color {
        static let secondaryBackgroundColor = UIColor.from(hex: "#f5f5f5")
        static let mintGreenColor = UIColor.from(hex: "#2ABB00")
        static let amountRedColor = UIColor.from(hex: "#ed6363")
        static let primaryText = UIColor.from(hex: "#454545")
        static let secondaryText = primaryText.withAlphaComponent(0.8)
    }
   
    struct Font {
        static let regular14 = UIFont.systemFont(ofSize: 14, weight: .regular)
        static let semibold16 = UIFont.systemFont(ofSize: 16, weight: .semibold)
        static let semibold15 = UIFont.systemFont(ofSize: 15, weight: .semibold)
        static let semibold14 = UIFont.systemFont(ofSize: 14, weight: .semibold)
        static let semibold24 = UIFont.systemFont(ofSize: 24, weight: .semibold)
    }
}

