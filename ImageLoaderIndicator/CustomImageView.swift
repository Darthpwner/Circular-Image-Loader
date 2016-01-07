//
//  CustomImageView.swift
//  ImageLoaderIndicator
//
//  Created by Rounak Jain on 24/01/15.
//  Copyright (c) 2015 Rounak Jain. All rights reserved.
//

import UIKit


class CustomImageView: UIImageView {
  
    let progressIndicatorView = CircularLoaderView(frame: CGRectZero)
  var timer: NSTimer = NSTimer()
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(self.progressIndicatorView)
        progressIndicatorView.frame = bounds
        progressIndicatorView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    }
    func animateCircle() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("animate"), userInfo: nil, repeats: true)
    }
    func animate(){
        self.progressIndicatorView.progress+=0.1
        if(self.progressIndicatorView.progress == 1.0){
          timer.invalidate()
        }
    }
}
