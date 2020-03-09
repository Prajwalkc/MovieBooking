//
//  SeatInfo.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation

class SeatInfoModel {
    var seatNo: String?
    var seatStatus: Int?
    var seatRow: String?
    var price: String?
    
    init(json: JSON) {
        self.seatNo = json["seatNo"].string
        self.seatStatus = json["seatStatus"].int
        self.seatRow = json["seatRow"].string
        self.price = json["price"].string
    }
}
