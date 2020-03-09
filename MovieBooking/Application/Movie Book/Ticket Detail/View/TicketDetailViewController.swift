//
//  TicketDetailViewController.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

protocol TicketDetailViewDelegate: class {
    func updateView(items: [TicketDetailViewModel], headerViewModel: BottomFooterViewModel?)
}

class TicketDetailViewController: UIViewController, TicketDetailViewDelegate {
    
    var confirmBookButtonView = UIButton()
    var presenter: TicketDetailViewPresenter?
    var tableViewAdapter: TicketTableViewAdapter?
    var tableView = UITableView()
    
    override func loadView() {
        let mainView = UIView()
        mainView.backgroundColor = Theme.Color.secondaryBackgroundColor
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    func updateView(items: [TicketDetailViewModel], headerViewModel: BottomFooterViewModel?) {
        
        tableViewAdapter = TicketTableViewAdapter(items: items, headerViewModel: headerViewModel)
        tableView.delegate = tableViewAdapter
        tableView.dataSource = tableViewAdapter
        tableView.reloadData()
    }
    
    private func setupViews() {
        self.title = "Movie Ticket Detail"
        tableView.setupForAutolayout(in: self.view)
        tableView.pinLeadingToLeading(of: self.view, constant: 0)
        tableView.pinTrailingToTrailing(of: self.view, constant: 0)
        tableView.pinTopToTop(of: self.view, constant: 8)
        tableView.backgroundColor = Theme.Color.secondaryBackgroundColor
        tableView.separatorStyle = .none
        confirmBookButtonView.setupForAutolayout(in: self.view)
        
        confirmBookButtonView.pinTopToBottom(of: tableView, constant: 0)
        confirmBookButtonView.pinLeadingToLeading(of: self.view, constant: 0)
        confirmBookButtonView.pinTrailingToTrailing(of: self.view, constant: 0)
        confirmBookButtonView.pinBottomToBottom(of: self.view, constant: 0)
        confirmBookButtonView.pinHeight(constant: 70)
        confirmBookButtonView.backgroundColor = Theme.Color.mintGreenColor
        confirmBookButtonView.setTitle("Confirm", for: .normal)
        confirmBookButtonView.setTitleColor(.white, for: .normal)
        confirmBookButtonView.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        confirmBookButtonView.titleLabel?.font = Theme.Font.semibold16
        
        tableView.register(TicketTableViewCell.self, forCellReuseIdentifier: "TicketTableViewCell")
        presenter?.prepareForPresentation()
        
    }
    
    @objc func confirmButtonTapped() {
        print("OK")
    }
    
}
