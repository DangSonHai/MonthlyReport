//
//  DrawView.swift
//  CoreGraphicsPart1
//
//  Created by Pham Quang Huy on 4/15/17.
//  Copyright © 2017 Framgia, Inc. All rights reserved.
//

import UIKit

class DrawView: UIView {
    var brush: BaseBrush?
    var strokeWidth: CGFloat
    var strokeColor: UIColor
    
    override init(frame: CGRect) {
        self.strokeWidth = 1.0
        self.strokeColor = UIColor.blackColor()
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.strokeWidth = 1.0
        self.strokeColor = UIColor.blackColor()
        
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.startPoint = touches.first!.locationInView(self)
            brush.endPoint = brush.startPoint
//            self.setNeedsDisplay()
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = touches.first?.locationInView(self)
            self.setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, self.strokeWidth)
        CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor)

        if let brush = self.brush {
            brush.drawInContext(context!)
        }
        
        CGContextStrokePath(context)
    }
}
