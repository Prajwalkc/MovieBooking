//
//  TicketTableViewAdapter.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

class TicketTableViewAdapter: NSObject, TableViewAdapter {
    
    var items: [TicketDetailViewModel]
    var headerViewModel: BottomFooterViewModel?
    
    init(items: [TicketDetailViewModel], headerViewModel: BottomFooterViewModel?) {
        self.items = items
        self.headerViewModel = headerViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketTableViewCell") as! TicketTableViewCell
        let currentItem = items[indexPath.row]
        cell.updateTicketView(model: currentItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = KeyValueView()
        
        headerView.updateView(model: self.headerViewModel)
        headerView.backgroundColor = .white
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 58
        
    }
    
    
}
