//
//  BaseBrush.swift
//  CoreGraphicsPart1
//
//  Created by Pham Quang Huy on 4/15/17.
//  Copyright © 2017 Framgia, Inc. All rights reserved.
//

import CoreGraphics

protocol PaintBrush{
    func drawInContext(context: CGContextRef)
}

class BaseBrush: NSObject, PaintBrush {
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    var strokeWidth: CGFloat!
    
    func drawInContext(context: CGContextRef) {
        assert(false, "implement in subclass.")
    }
}