//
//  SeatDetailViewController.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

enum SeatDetailViewSection {
    case seatSelectionView(items: [String: [SeatInfoModel]])
    case screenView
    case seatTypeView
}

protocol MovieSeatSelectionViewDelegate: class {
    func configureSeatCollectionView(sections: [SeatDetailViewSection])
    func setupBottomFooterView(model: BottomFooterViewModel?)
    func hideBottomFooterView()
    
}

class MovieSeatDetailViewController: UIViewController, MovieSeatSelectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var tableView = UITableView()
    
    let bottomFooterView = MovieBottomFooterView()
    var bottomConstraint = NSLayoutConstraint()
    
    var selectedSeats = [SeatInfoModel]()
    var priceAndTicketViewModel: BottomFooterViewModel?
    
    var adapter: MovieSeatDetailTableViewAdapter?
    var presenter: MovieSeatDetailViewPresenterProtocol?
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Seat Detail"
        presenter = MovieSeatDetailViewPresenter(delegate: self)
        presenter?.getSeatList()
        setupView()
    }
    
    func setupView() {
        
        self.view.backgroundColor = UIColor.from(hex: "#f5f5f5")
        tableView.setupForAutolayout(in: self.view)
        tableView.separatorStyle = .none
        tableView.pinLeadingToLeading(of: self.view, constant: 8)
        tableView.pinTrailingToTrailing(of: self.view, constant: 8)
        tableView.pinTopToTop(of: self.view, constant: 8)
        tableView.backgroundColor = UIColor.from(hex: "#f5f5f5")
        
        bottomFooterView.setupForAutolayout(in: self.view)
        bottomFooterView.pinTopToBottom(of: tableView, constant: 0)
        bottomFooterView.pinLeadingToLeading(of: self.view, constant: 0)
        bottomFooterView.pinTrailingToTrailing(of: self.view, constant: 0)
        bottomConstraint = bottomFooterView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 70)
        bottomConstraint.isActive = true
        bottomFooterView.pinHeight(constant: 70)
        bottomFooterView.backgroundColor = .white
        bottomFooterView.onProceedButtonTapped = {
            self.moveToTicketViewController()
        }
        
    }
    
    //MARK:- NAVIGATION
    func moveToTicketViewController() {
        let ticketVC = TicketDetailViewController()
        let ticketPresenter = TicketDetailViewPresenter(delegate: ticketVC, items: self.selectedSeats, headerViewModel: self.priceAndTicketViewModel)
        ticketVC.presenter = ticketPresenter
        self.navigationController?.pushViewController(ticketVC, animated: true)
    }
    
    
    //MARK:- VIEW DELEGATES
    func configureSeatCollectionView(sections: [SeatDetailViewSection]) {
        
        adapter = MovieSeatDetailTableViewAdapter(sections: sections)
        adapter?.onSeatSelection = { item in
            self.processSelectedItem(item: item)
        }
        adapter?.onSeatUnSelection = { item in
            self.processForUnSelectedItem(item: item)
        }
        adapter?.configureTableViewCells(tableView: self.tableView)
        
        tableView.dataSource = adapter
        tableView.delegate = adapter
        tableView.reloadData()
    }
    
    
    func setupBottomFooterView(model: BottomFooterViewModel?) {
        self.showBottomView()
        self.priceAndTicketViewModel = model
        self.bottomFooterView.updateView(model: model)
    }
    
    func hideBottomFooterView() {
        self.hideBottomView()
        self.selectedSeats.removeAll()
    }
    
    func showBottomView() {
          UIView.animate(withDuration: 0.3) {
              self.bottomConstraint.constant = 0
              self.bottomConstraint.isActive = true
              self.view.layoutIfNeeded()
          }
      }
      
      func hideBottomView() {
          UIView.animate(withDuration: 0.3) {
              self.bottomConstraint.constant = 80
              self.bottomConstraint.isActive = true
              self.view.layoutIfNeeded()
          }
      }
    
    
    //MARK: - TABLE VIEW CELL DELEGATES
    func processForUnSelectedItem(item: SeatInfoModel?) {
        
        guard let itemUnSelected = item else { return }
        
        let index = selectedSeats.firstIndex { (eachItem) -> Bool in
            eachItem.seatNo ?? "" == itemUnSelected.seatNo ?? ""
            } ?? 0
        selectedSeats.remove(at: index)
        self.presenter?.processForBottomView(list: selectedSeats)
        
    }
    
    func processSelectedItem(item: SeatInfoModel?) {
        guard let selectedItem = item else { return }
        self.selectedSeats.append(selectedItem)
        self.presenter?.processForBottomView(list: self.selectedSeats)
        
    }
    
}
