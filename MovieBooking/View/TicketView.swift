//
//  TicketView.swift
//  MovieBooking
//
//  Created by Prajwal kc on 3/8/20.
//  Copyright © 2020 Prajwal kc. All rights reserved.
//

import Foundation
import UIKit

class TicketView: UIView {
    
    var seperatorView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func draw(_ rect: CGRect) {
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width * 0.6 - 13, y: 0.0))
        path.addArc(withCenter: CGPoint(x: self.frame.size.width * 0.6, y: 0),
                    radius: 13,
                    startAngle: CGFloat(180.0).degreesToRadians,
                    endAngle: CGFloat(0.0).degreesToRadians,
                    clockwise: false)
        path.addLine(to: CGPoint(x: self.frame.size.width * 0.6 + 13, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width * 0.6 + 13, y: self.frame.size.height))
        
        path.addArc(withCenter: CGPoint(x: self.frame.size.width * 0.6, y: self.frame.height),
                    radius: 13,
                    startAngle: CGFloat(0.0).degreesToRadians,
                    endAngle: CGFloat(180.0).degreesToRadians,
                    clockwise: false)
        path.addLine(to: CGPoint(x: self.frame.size.width * 0.6 - 13, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        self.layer.mask = shapeLayer
        addSeperatorView()
    }
    
    private func addSeperatorView() {
        let frame = CGRect(origin: CGPoint(x: self.frame.width * 0.6 - 1, y: 13), size: CGSize(width: 2, height: self.frame.height - 16))
        seperatorView = UIImageView(frame: frame)
        seperatorView.image = UIImage(named: "line")
        
        self.addSubview(seperatorView)
    }
}
