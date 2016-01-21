//
//  CircularLoaderView.swift
//  ImageLoaderIndicator
//
//  Created by Richard Turton on 17/02/2015.
//  Copyright (c) 2015 Rounak Jain. All rights reserved.
//

import UIKit

class CircularLoaderView: UIView {
    
    let circlePathLayer = CAShapeLayer()
    var circleRadius: CGFloat = 0   //Needs a default value
    var circleCenter: CGPoint = CGPoint()
    
    var progress: CGFloat {
        get {
            return circlePathLayer.strokeEnd
        }
        set {
            print("New value \(newValue)")
            if (newValue > 1) {
                circlePathLayer.strokeEnd = 1
            } else if (newValue < 0) {
                circlePathLayer.strokeEnd = 0
            } else {
                circlePathLayer.strokeEnd = newValue
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        circleCenter = CGPoint(x: 0, y: 0)
        circlePathLayer.frame = bounds
        circlePathLayer.lineWidth = 10
        circlePathLayer.fillColor = UIColor.clearColor().CGColor
        circlePathLayer.strokeColor = UIColor.whiteColor().CGColor
        layer.addSublayer(circlePathLayer)
        backgroundColor = UIColor.orangeColor()
        progress = 0
        
        displayLogo()
        displayStatus()
        displayPercentage()
    }
    
    func displayLogo() {
        var imageViewObject :UIImageView
        imageViewObject = UIImageView(frame:CGRectMake(0, 0, 100, 100));
        imageViewObject.image = UIImage(named:"Lighthouse-Image.png")
        imageViewObject.contentMode = UIViewContentMode.ScaleToFill
        self.addSubview(imageViewObject)
    }
    
    func displayStatus() {
        let statusLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
        statusLabel.center = CGPointMake(160, 284)
        statusLabel.textAlignment = NSTextAlignment.Center
        statusLabel.textColor = UIColor.whiteColor()
        statusLabel.text = "(Up)loading"
        self.addSubview(statusLabel)
    }
    
    func displayPercentage() {
        //        let statusLabel = UILabel(frame: CGRectMake(0, -1000, 200, 21))
        //        statusLabel.center = CGPointMake(160, 284)
        //        statusLabel.textAlignment = NSTextAlignment.Center
        //        statusLabel.textColor = UIColor.whiteColor()
        //        statusLabel.text = "200%"
        //        self.addSubview(statusLabel)
    }

    
    func circleFrame() -> CGRect {
        let circleFrame = CGRect(x: 0, y: 0, width: 2*circleRadius, height: 2*circleRadius)
        return circleFrame
    }
    
    func circlePath() -> UIBezierPath {
        return UIBezierPath(arcCenter: CGPoint(x: circleRadius, y: circleRadius), radius: circleRadius, startAngle: CGFloat (-M_PI_2), endAngle: CGFloat (M_PI + M_PI_2), clockwise: true)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circlePathLayer.frame = bounds
        circlePathLayer.path = circlePath().CGPath
    }

}
