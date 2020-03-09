//
//  MovieApiService.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation

protocol MovieApiService {
    func getSeatList( onCompletion: @escaping(([SeatInfoModel])->()))
}

class MovieApiManager: MovieApiService {
   
    func getSeatList(onCompletion: @escaping (([SeatInfoModel]) -> ())) {
        
        let responseString = MockResponse.mockResponse
            let data = responseString.data(using: .utf16)
            let responseData = try? JSON(data: data ?? Data())
            var seatList = [SeatInfoModel]()
            let response = responseData!["seatList"].arrayValue
              seatList =  response.map {
                    SeatInfoModel(json: $0)
            }
            onCompletion(seatList)
        
    }
}
