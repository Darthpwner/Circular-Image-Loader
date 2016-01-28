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
    
    let imageViewObject = UIImageView(frame:CGRectMake(0, 0, 100, 100));
    let statusLabel = UILabel(frame: CGRectMake(0, 0, 200, 20))
    let percentageLabel = UILabel(frame: CGRectMake(0, 0, 200, 20))
    
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
        
        displayLogo() //Need help shrinking the image down
        displayStatus()
        displayPercentage()
    }
    
    func displayLogo() {
        imageViewObject.center = CGPointMake(65, 50)    //Line doesn't do shit

        
        imageViewObject.image = UIImage(named:"Lighthouse-Image.png")
        imageViewObject.contentMode = UIViewContentMode.ScaleToFill //Line doesn't do shit
        
        self.addSubview(imageViewObject)
    }
    
    func displayStatus() {
        statusLabel.textAlignment = NSTextAlignment.Center
        statusLabel.textColor = UIColor.whiteColor()
        statusLabel.text = "(Up)loading"
        
        self.addSubview(statusLabel)
    }
    
    func displayPercentage() {
        percentageLabel.textAlignment = NSTextAlignment.Center
        percentageLabel.textColor = UIColor.whiteColor()
        percentageLabel.text = "100%"
        
        self.addSubview(percentageLabel)
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
        
        statusLabel.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        percentageLabel.center = CGPointMake(CGRectGetMidX(self.bounds), 4 * frame.height / 5)
//        imageViewObject.center = CGPointMake(CGRectGetMidX(self.bounds), 1 * frame.height / 5)  //Fix this crap
        imageViewObject.frame = CGRectMake(2 * frame.width / 5, 1 * frame.height / 5, 20, 20);
    }
}
