//
//  MovieSeatDetailTableViewCell.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

class MovieSeatDetailTableViewCell: UITableViewCell, UIScrollViewDelegate {
    
    var onSeatSelected: ((SeatInfoModel?)->())?
    var onSeatUnSelected: ((SeatInfoModel?)->())?
    
    let mainContainerView = UIView()
    
    var minimumZoomScale: CGFloat = 0.5
    var maximumZoomScale: CGFloat = 2
    var scrollViewSize = CGSize()
    var scrollView = UIScrollView()
    
    var seatXposition: CGFloat = 0
    var seatYposition: CGFloat = 8
    var seatHorizontalSpacing: CGFloat = 8
    var seatVerticalSpacing: CGFloat = 8
    var seatSize = CGSize(width: 40, height: 50)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    private func setupView() {
        
        mainContainerView.setupForAutolayout(in: self.contentView)
        mainContainerView.pin(left: 0, right: 0, top: 0, bottom: 0, toView: self.contentView)
        
        scrollView.setupForAutolayout(in: mainContainerView)
        scrollView.pin(left: 0, right: 0, top: 0, bottom: 0, toView: mainContainerView)
        
        scrollView.backgroundColor = Theme.Color.secondaryBackgroundColor
        
        scrollView.minimumZoomScale = minimumZoomScale
        scrollView.maximumZoomScale = maximumZoomScale
        
        scrollView.delegate = self
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.contentView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.scrollView.contentSize = self.scrollViewSize
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configureSeatCollectionView(seatList: [String: [SeatInfoModel]]) {
        
        let filteredListKeys = seatList.keys.sorted()
        
        var maxCount: CGFloat = 0
        
        for key in filteredListKeys {
            let seatRow = seatList[key] ?? []
            var rowCount: CGFloat = 0
            let titleView = MovieSeatView()
            titleView.seatType = .title
            titleView.frame = CGRect(x: seatXposition, y: seatYposition, width: seatSize.width, height: seatSize.height)
            seatXposition += seatSize.width
            titleView.seatLabel.text = key
            titleView.seatLabel.font = UIFont.boldSystemFont(ofSize: 20)
            self.scrollView.addSubview(titleView)
            
            for eachValue in seatRow {
                
                let view = MovieSeatView()
                view.seatLabel.text = eachValue.seatNo ?? ""
                view.frame = CGRect(x: seatXposition, y: seatYposition, width: seatSize.width, height: seatSize.height)
                view.configureView(model: eachValue)
                self.scrollView.addSubview(view)
                seatXposition += seatSize.width + seatHorizontalSpacing
                rowCount += 1
                view.onSeatSelection = { model in
                    self.selectedSeat(model: model)
                }
                view.onSeatUnSelection = { model in
                    self.onSeatUnSelected?(model)
                }
            }
            seatXposition = 0
            seatYposition += seatSize.height + seatVerticalSpacing
            maxCount = max(maxCount, rowCount)
        }
        var scrollViewWidth = (seatSize.width + seatHorizontalSpacing) * maxCount
        scrollViewWidth += 50 + seatHorizontalSpacing
        let height = CGFloat((seatList.count) * (58))
        scrollViewSize = CGSize(width: scrollViewWidth, height: height)
        scrollView.contentSize = scrollViewSize
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
    
    func selectedSeat(model: SeatInfoModel?) {
        onSeatSelected?(model)
    }
}
