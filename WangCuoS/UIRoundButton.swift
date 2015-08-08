//
//  UIRoundButton.swift
//  WangCuoS
//
//  Created by EyreFree on 15/4/27.
//  Copyright (c) 2015年 eyrefree. All rights reserved.
//

import UIKit
import QuartzCore

class UIRoundButton: UIButton {
    var btnIsSelected = false
    var bgIsColor = true
    
    var bianWidth:CGFloat = 1.0
    var bian2Width:CGFloat = 3.0
    var marginWidth:CGFloat = 3.0
    
    var bgImageNormal:UIImage!
    var bgImageSelected:UIImage!
    
    var bgColorNormal:UIColor = UIColor.whiteColor()
    var bgColorSelected:UIColor = UIColor.whiteColor()
    
    func initUIRoundButton(imageNormal:UIImage, imageSelected:UIImage) {
        bgIsColor = false
        bgImageNormal = imageNormal
        bgImageSelected = imageSelected
    }
    
    func initUIRoundButton(colorNormal:UIColor, colorSelected:UIColor) {
        bgIsColor = true
        bgColorNormal = colorNormal
        bgColorSelected = colorSelected
    }
    
    func setCheckState(isSelected:Bool) {
        btnIsSelected = isSelected
    }
    
    func setLineWidth(bian:CGFloat, bian2:CGFloat, margin:CGFloat) {
        bianWidth = bian
        bian2Width = bian2
        marginWidth = margin
    }
    
    func getState()->Bool {
        return btnIsSelected
    }
    
    func refresh() {
        setNeedsDisplayInRect(self.bounds)
    }
    
    override func drawRect(rect: CGRect) {
        let suo:CGFloat = marginWidth
        
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()
        let len = (self.bounds.width > self.bounds.height ? self.bounds.height : self.bounds.width) - suo * 2
        let rectRange:CGRect = CGRectMake(suo, suo, len - suo, len - suo)
        let rectContext:CGRect = CGRectMake(suo + bian2Width, suo + bian2Width, len - suo - bian2Width * 2, len - suo - bian2Width * 2)
        let rectContextAgain:CGRect = CGRectMake(len / 7.0 * 2.0, len / 7.0 * 2.0, len / 2.0, len / 2.0)
        
        if (btnIsSelected) {
            CGContextSetRGBStrokeColor(currentContext, 81.0/255.0, 154.0/255.0, 221.0/255.0, 1.0)
            CGContextSetLineWidth(currentContext, bianWidth)
            CGContextAddEllipseInRect(currentContext, rectRange)
            CGContextDrawPath(currentContext, kCGPathStroke)
            
            if (bgIsColor) {
                CGContextSetFillColorWithColor(currentContext, bgColorSelected.CGColor)
                CGContextFillEllipseInRect(currentContext, rectContext)
            } else {
                bgImageSelected.drawInRect(rectContextAgain)
            }
        } else {
            CGContextSetRGBStrokeColor(currentContext, 228.0/255.0, 228.0/255.0, 228.0/255.0, 1.0)
            CGContextSetLineWidth(currentContext, bianWidth)
            CGContextAddEllipseInRect(currentContext, rectRange)
            CGContextDrawPath(currentContext, kCGPathStroke)
            
            if (bgIsColor) {
                CGContextSetFillColorWithColor(currentContext, bgColorNormal.CGColor)
                CGContextFillEllipseInRect(currentContext, rectContext)
            } else {
                bgImageNormal.drawInRect(rectContextAgain)
            }
        }
        
        super.drawRect(rect)
    }
}