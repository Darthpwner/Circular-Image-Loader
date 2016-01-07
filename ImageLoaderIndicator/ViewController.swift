//
//  ViewController.swift
//  ImageLoaderIndicator
//
//  Created by Rounak Jain on 28/12/14.
//  Copyright (c) 2014 Rounak Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var myCustomImageView: CustomImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    // just waiting on the app to be in front of me
    // going to start the animation now.
    super.viewDidAppear(animated)
    myCustomImageView.animateCircle()
  }
  
}

