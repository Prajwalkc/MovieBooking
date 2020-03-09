//
//  SeatDetailViewPresenter.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

protocol MovieSeatDetailViewPresenterProtocol {
    var delegate: MovieSeatSelectionViewDelegate? { get set }
    func getSeatList()
    func processForBottomView(list: [SeatInfoModel])
    func getTotalPrice(list:[SeatInfoModel]) -> String
    
}

class MovieSeatDetailViewPresenter: MovieSeatDetailViewPresenterProtocol {
    
    weak var delegate: MovieSeatSelectionViewDelegate?
    
    var movieApiManager: MovieApiService
    
    init(delegate: MovieSeatSelectionViewDelegate) {
        self.delegate = delegate
        self.movieApiManager = MovieApiManager()
    }
    
    func getSeatList() {
        self.movieApiManager.getSeatList { (list) in
            let filteredListForView = self.filterList(list: list)
            var sections = [SeatDetailViewSection]()
            sections.append(.seatTypeView)
            sections.append(.screenView)
            sections.append(.seatSelectionView(items: filteredListForView))
          
            self.delegate?.configureSeatCollectionView(sections: sections)
        }
    }
    
    func processForBottomView(list: [SeatInfoModel]) {
        
        guard list.count > 0 else {
            self.delegate?.hideBottomFooterView()
            return
        }
        
        let totalSeatCount = "\(list.count)"
        let totalPrice = self.getTotalPrice(list: list)
        let bottomViewModel = BottomFooterViewModel(totalPrice: totalPrice, totalSeatNumber: totalSeatCount)
        self.delegate?.setupBottomFooterView(model: bottomViewModel)
     
   
    }
    
    func getTotalPrice(list:[SeatInfoModel]) -> String {
        var totalPrice: String = "0"
        var totalPriceDouble : Double = 0.0
        for each in list {
            let priceInDouble = Double(each.price ?? "0.0") ?? 0.0
            totalPriceDouble += priceInDouble
        }
        totalPrice = "NPR \(totalPriceDouble)"
        return totalPrice
    }
    
    func filterList(list: [SeatInfoModel]) -> [String: [SeatInfoModel]] {
        
        var seatInfoDict = [String: [SeatInfoModel]]()
        for eachSeat in list {
            let seatTitle = eachSeat.seatRow ?? ""
            var seatInfoArray = seatInfoDict[seatTitle] ?? []
            seatInfoArray.append(eachSeat)
            seatInfoDict[seatTitle] = seatInfoArray
        }
        return seatInfoDict
    }
}

