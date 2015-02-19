//
//  UIViewInnerShadow.swift
//  UIViewInnerShadow
//
//  Created by Zane Swafford on 2/18/15.
//  Copyright (c) 2015 Zane Swafford. All rights reserved.
//

import UIKit

enum InnerShadowDirection {
    case Top
    case Right
    case Bottom
    case Left
}

extension UIView {

    func makeInsetShadow() {
        let directions:Array<InnerShadowDirection> = [.Top, .Right, .Bottom, .Left]
        let color = UIColor(red:0.0, green:0.0, blue:0.0, alpha:0.4)
        var shadowView = self.createShadowView(radius:0.0, color:color, directions:directions)
        
        self.addSubview(shadowView)
    }
        
    func makeInsetShadow(#radius:CGFloat, alpha:CGFloat) {
        let directions:Array<InnerShadowDirection> = [.Top, .Right, .Bottom, .Left]
        let color = UIColor(red:0.0, green:0.0, blue:0.0, alpha:alpha)
        var shadowView = self.createShadowView(radius:radius, color:color, directions:directions)
   
        self.addSubview(shadowView)
    }
        
    func makeInsetShadow(#radius:CGFloat, color:UIColor, directions:Array<InnerShadowDirection>) {
        var shadowView = self.createShadowView(radius:radius, color:color, directions:directions)

        self.addSubview(shadowView)
    }
        
    func createShadowView(#radius:CGFloat, color:UIColor, directions:Array<InnerShadowDirection>) -> (UIView) {
        var shadowView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        shadowView.layer.cornerRadius = radius
        shadowView.backgroundColor = UIColor.clearColor()
      
        for direction:InnerShadowDirection in directions {
            var shadow = CAGradientLayer()
            
            if (direction == .Top) {
                shadow.startPoint = CGPoint(x: 0.5, y: 0.0)
                shadow.endPoint = CGPoint(x: 0.5, y: 1.0)
                shadow.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: radius)
            } else if (direction == .Bottom) {
                shadow.startPoint = CGPoint(x: 0.5, y: 1.0)
                shadow.endPoint = CGPoint(x: 0.5, y: 0.0)
                shadow.frame = CGRect(x: 0, y: self.bounds.size.height - radius, width: self.bounds.size.width, height: radius)
            } else if (direction == .Left) {
                shadow.frame = CGRect(x: 0, y: 0, width: radius, height: self.bounds.size.height)
                shadow.startPoint = CGPoint(x: 0.0, y: 0.5)
                shadow.endPoint = CGPoint(x: 1.0, y: 0.5)
            } else if (direction == .Right) {
                shadow.frame = CGRect(x: self.bounds.size.width - radius, y: 0, width: radius, height: self.bounds.size.height)
                shadow.startPoint = CGPoint(x: 1.0, y: 0.5)
                shadow.endPoint = CGPoint(x: 0.0, y: 0.5)
            }
            
            shadow.cornerRadius = radius
            shadow.colors = [color.CGColor, UIColor.clearColor().CGColor]
            shadowView.layer.insertSublayer(shadow, atIndex:0)
        }
        
        return shadowView;
    }
}