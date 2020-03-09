//
//  Foundation+Extension.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    
    // Default scale is for 1x screen
    var adaptible: CGFloat {
        return (self/320) * UIScreen.main.bounds.width
    }
    
    var degreesToRadians: CGFloat {
        return self * .pi / 180
    }
    var radiansToDegrees: CGFloat {
        return self * 180 / .pi
    }
}
