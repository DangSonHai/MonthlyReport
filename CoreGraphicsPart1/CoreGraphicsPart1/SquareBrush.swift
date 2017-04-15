//
//  SquareBrush.swift
//  CoreGraphicsPart1
//
//  Created by Pham Quang Huy on 4/15/17.
//  Copyright © 2017 Framgia, Inc. All rights reserved.
//

import CoreGraphics

class SquareBrush: BaseBrush {
    override func drawInContext(context: CGContextRef) {
        guard let startPoint = self.startPoint, endPoint = self.endPoint else {
            return
        }
        let origin = CGPointMake(min(startPoint.x, endPoint.x), min(startPoint.y, endPoint.y))
        let size = CGSizeMake(abs(endPoint.x - startPoint.x), abs(endPoint.y - startPoint.y))
        CGContextAddRect(context, CGRect(origin: origin, size: size))
    }
}
