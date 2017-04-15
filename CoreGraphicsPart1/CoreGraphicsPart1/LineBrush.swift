//
//  PenBrush.swift
//  CoreGraphicsPart1
//
//  Created by Pham Quang Huy on 4/15/17.
//  Copyright © 2017 Framgia, Inc. All rights reserved.
//

import UIKit

class LineBrush: BaseBrush {
    override func drawInContext(context: CGContextRef) {
        guard let startPoint = self.startPoint, endPoint = self.endPoint else {
            return
        }
        
        CGContextMoveToPoint(context, startPoint.x, startPoint.y)
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
    }
}
