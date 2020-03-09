//
//  TicketDetailViewPresenter.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation

class TicketDetailViewPresenter {
    
    weak var delegate: TicketDetailViewDelegate?
    var items: [SeatInfoModel]
    var headerViewModel: BottomFooterViewModel?
    
    init(delegate: TicketDetailViewDelegate, items: [SeatInfoModel], headerViewModel: BottomFooterViewModel?) {
        self.delegate = delegate
        self.items = items
        self.headerViewModel = headerViewModel
    }
    
    func prepareForPresentation() {
        
        let viewModel = items.map {
            TicketDetailViewModel(movieName: "Iron Man", movieTicketNumber: $0.seatNo, movieDate: "17th Oct, 2020", moviePrice: $0.price)
        }
        self.delegate?.updateView(items: viewModel, headerViewModel: self.headerViewModel)
        
    }
}
