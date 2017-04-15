//
//  SloppyView.swift
//  CoreGraphicsPart1
//
//  Created by Pham Quang Huy on 4/21/17.
//  Copyright © 2017 Framgia, Inc. All rights reserved.
//

import UIKit

class SloppyView: UIView {

    var beSloppy = true {
        willSet {
            setNeedsDisplay()
        }
    }
    
    func saveGState(context: CGContextRef, drawStuff: () -> ()) {
        CGContextSaveGState(context)
        drawStuff()
        CGContextRestoreGState(context)
    }
    
    func drawRedCircle(context: CGContextRef,rect: CGRect) {
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
        CGContextStrokeEllipseInRect(context, rect)
    }
    
    // MARK: Methods - Draw sloppily
    func drawSloppily(context:  CGContextRef) {
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextSetLineWidth(context, 3.0)
        
        let innerRect = CGRectInset(self.bounds, 20.0, 20.0)
        CGContextSetStrokeColorWithColor(context, UIColor.orangeColor().CGColor)
        drawRedCircle(context, rect: innerRect)
        CGContextStrokeRect(context, innerRect)
    }
    
    // MARK: Methods - Draw nicely
    func drawNicely(context: CGContextRef) {
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextSetLineWidth(context, 3.0)
        
        let innerRect = CGRectInset(self.bounds, 20.0, 20.0)
        CGContextSetStrokeColorWithColor(context, UIColor.orangeColor().CGColor)
        saveGState(context) { 
            self.drawRedCircle(context, rect: innerRect)
        }
        CGContextStrokeRect(context, innerRect)
    }
    
    // MARK: Override Draw
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        if beSloppy {
            drawSloppily(context)
        } else {
            drawNicely(context)
        }
    }
}
