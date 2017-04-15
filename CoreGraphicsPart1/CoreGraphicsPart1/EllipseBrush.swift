//
//  EllipseBrush.swift
//  CoreGraphicsPart1
//
//  Created by Pham Quang Huy on 4/23/17.
//  Copyright © 2017 Framgia, Inc. All rights reserved.
//

import CoreGraphics

class EllipseBrush: BaseBrush {
    override func drawInContext(context: CGContextRef) {
        guard let startPoint = self.startPoint, endPoint = self.endPoint else {
            return
        }
        
        var radius = 0.0
        var centerX = abs(endPoint.x - startPoint.x) / 2
        var centerY = abs(endPoint.y - startPoint.y) / 2
        centerX += (startPoint.x < endPoint.x) ? startPoint.x : endPoint.x
        centerY += (startPoint.y < endPoint.y) ? startPoint.y : endPoint.y
        radius = sqrt(pow(Double(endPoint.x) - Double(startPoint.x), 2.0) + pow(Double(endPoint.y) - Double(startPoint.y), 2.0)) / 2
        CGContextAddArc(context, centerX, centerY, CGFloat(radius), 0, CGFloat(M_PI * 2), 0)
    }
}