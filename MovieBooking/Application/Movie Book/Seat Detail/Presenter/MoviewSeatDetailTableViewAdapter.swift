//
//  SeatDetailTableViewAdapter.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewAdapter: UITableViewDelegate, UITableViewDataSource{
}

class MovieSeatDetailTableViewAdapter: NSObject, TableViewAdapter {
    
    var onSeatSelection: ((SeatInfoModel?)->())?
    var onSeatUnSelection: ((SeatInfoModel?)->())?
    
    var sections: [SeatDetailViewSection]
    
    init(sections: [SeatDetailViewSection]) {
        self.sections = sections
    }
    
    func configureTableViewCells(tableView: UITableView) {
        tableView.register(MovieSeatDetailTableViewCell.self, forCellReuseIdentifier: "MovieSeatDetailTableViewCell")
        tableView.register(MovieSeatInfoTableViewCell.self, forCellReuseIdentifier: "MovieSeatInfoTableViewCell")
        tableView.register(ScreenViewTableViewCell.self, forCellReuseIdentifier: "ScreenViewTableViewCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentSection = sections[indexPath.section]
        
        switch currentSection {
        case .seatSelectionView(let items):
            let scrollViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieSeatDetailTableViewCell") as! MovieSeatDetailTableViewCell
            scrollViewCell.configureSeatCollectionView(seatList: items)
            scrollViewCell.onSeatSelected = { item in
                self.onSeatSelection?(item)
            }
            scrollViewCell.onSeatUnSelected = { item in
                self.onSeatUnSelection?(item)
            }
            scrollViewCell.selectionStyle = .none
            scrollViewCell.scrollView.flashScrollIndicators()
            scrollViewCell.backgroundColor = Theme.Color.secondaryBackgroundColor
            return scrollViewCell
        case .seatTypeView:
            let infoViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieSeatInfoTableViewCell") as! MovieSeatInfoTableViewCell
            infoViewCell.selectionStyle = .none
            infoViewCell.backgroundColor = Theme.Color.secondaryBackgroundColor
            return infoViewCell
        case .screenView:
            let screenViewCell = tableView.dequeueReusableCell(withIdentifier: "ScreenViewTableViewCell") as! ScreenViewTableViewCell
            screenViewCell.backgroundColor = Theme.Color.secondaryBackgroundColor
            return screenViewCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentSection = sections[indexPath.section]
        print(currentSection)
        switch currentSection {
        case .seatSelectionView(let items):
            return CGFloat(items.count * 40)
        case .seatTypeView:
            return 180
        case .screenView:
            return 150
        }
    }
}
