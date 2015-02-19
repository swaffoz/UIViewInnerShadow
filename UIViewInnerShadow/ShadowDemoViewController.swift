//
//  ViewController.swift
//  UIView Inner Shadow
//
//  Created by Zane Swafford on 2/18/15.
//  Copyright (c) 2015 Zane Swafford. All rights reserved.
//

import UIKit

class ShadowDemoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sampleView1 = UIView(frame: CGRect(x: 10, y: 30, width: 100, height: 100))
        sampleView1.makeInsetShadow(radius:10.0, alpha:0.4)
        self.view.addSubview(sampleView1)
        
        var sampleView2 = UIView(frame: CGRect(x: 150, y: 150, width: 100, height: 200))
        sampleView2.makeInsetShadow(radius:10.0, color:UIColor(red:0.0, green:0.0, blue:0.0, alpha:0.4), directions: [.Top, .Bottom])
        self.view.addSubview(sampleView2)
    }
}