//
//  CircularLoaderView.swift
//  ImageLoaderIndicator
//
//  Created by Richard Turton on 17/02/2015.
//  Copyright (c) 2015 Rounak Jain. All rights reserved.
//

import UIKit

class CircularLoaderView: UIView {
    func updateTextValue(x: CGFloat) {
        percentageLabel.text = "\(progress * 100)%"
    }
    
    let circlePathLayer = CAShapeLayer()
    var circleRadius: CGFloat = 0   //Needs a default value
    var circleCenter: CGPoint = CGPoint()
    
    let imageViewObject = UIImageView()
    //Values need to be hardcoded for some reason
    let statusLabel = UILabel(frame: CGRectMake(0, 0, 200, 20))
    let percentageLabel = UILabel(frame: CGRectMake(0, 0, 200, 20))
    //
    
    //Constants
    let PERCENTAGE_LABEL_HEIGHT: CGFloat = 3.5/5
    let IMAGE_VIEW_OBJECT_X: CGFloat = 1.75/5
    let IMAGE_VIEW_OBJECT_Y: CGFloat = 0.5/5
    
    let IMAGE_VIEW_OBJECT_WIDTH: CGFloat = 50
    let IMAGE_VIEW_OBJECT_HEIGHT: CGFloat = 50
    //
    
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
        imageViewObject.image = UIImage(named:"Lighthouse-Image.png")
        
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
        percentageLabel.center = CGPointMake(CGRectGetMidX(self.bounds), PERCENTAGE_LABEL_HEIGHT * frame.height)
        imageViewObject.frame = CGRectMake(IMAGE_VIEW_OBJECT_X * frame.width, IMAGE_VIEW_OBJECT_Y * frame.height, IMAGE_VIEW_OBJECT_WIDTH, IMAGE_VIEW_OBJECT_HEIGHT);
    }
}
