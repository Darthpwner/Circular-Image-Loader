//
//  CustomImageView.swift
//  ImageLoaderIndicator
//
//  Created by Rounak Jain on 24/01/15.
//  Copyright (c) 2015 Rounak Jain. All rights reserved.
//

import UIKit


class CustomImageView: UIImageView {
  
    var progressIndicatorView: CircularLoaderView = CircularLoaderView()
    var timer: NSTimer = NSTimer()
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
  func initProgressIndicator(width: Int, height: Int){
        progressIndicatorView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        progressIndicatorView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        progressIndicatorView.circleRadius = CGFloat(width/2)
        addSubview(self.progressIndicatorView)
    }
    func animateCircle() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("animate"), userInfo: nil, repeats: true)
    }
    func animate(){
        self.progressIndicatorView.progress += 0.1
        progressIndicatorView.updateTextValue(self.progressIndicatorView.progress)
        if(self.progressIndicatorView.progress == 1.0){
          timer.invalidate()
        }
    }
}
