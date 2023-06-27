#import "NSBezierPath-Utilities.h"

// see https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CocoaDrawingGuide/Paths/Paths.html

static void CGPathToBezierPathFunction(void *info, const CGPathElement *element) {
    NSBezierPath *bezierPath = (__bridge NSBezierPath *)info;
    CGPoint *points = element->points;
    switch(element->type) {
        case kCGPathElementMoveToPoint: [bezierPath moveToPoint:points[0]]; break;
        case kCGPathElementAddLineToPoint: [bezierPath lineToPoint:points[0]]; break;
        case kCGPathElementAddQuadCurveToPoint: {
            NSPoint qp0 = bezierPath.currentPoint, qp1 = points[0], qp2 = points[1], cp1, cp2;
            CGFloat m = (2.0 / 3.0);
            cp1.x = (qp0.x + ((qp1.x - qp0.x) * m));
            cp1.y = (qp0.y + ((qp1.y - qp0.y) * m));
            cp2.x = (qp2.x + ((qp1.x - qp2.x) * m));
            cp2.y = (qp2.y + ((qp1.y - qp2.y) * m));
            [bezierPath curveToPoint:qp2 controlPoint1:cp1 controlPoint2:cp2];
            break;
        }
        case kCGPathElementAddCurveToPoint: [bezierPath curveToPoint:points[2] controlPoint1:points[0] controlPoint2:points[1]]; break;
        case kCGPathElementCloseSubpath: [bezierPath closePath]; break;
    }
}

@implementation NSBezierPath (Utilities)

+ (NSBezierPath *)bezierPathFromCGPath:(CGPathRef)cgPath {
    NSBezierPath *bezierPath = [NSBezierPath bezierPath];
    CGPathApply(cgPath, (__bridge void *)bezierPath, CGPathToBezierPathFunction);
    return bezierPath;
}

- (CGPathRef)quartzPath
{
    int i, numElements;
    
    // Need to begin a path here.
    CGPathRef immutablePath = NULL;
    
    // Then draw the path elements.
    numElements = (int) [self elementCount];
    if (numElements > 0)
    {
        CGMutablePathRef    path = CGPathCreateMutable();
        NSPoint             points[3];
        BOOL                didClosePath = NO;
        
        for (i = 0; i < numElements; i++)
        {
            switch ([self elementAtIndex:i associatedPoints:points])
            {
                case NSBezierPathElementMoveTo:
                    CGPathMoveToPoint(path, NULL, points[0].x, points[0].y);
                    break;
                    
                case NSBezierPathElementLineTo:
                    CGPathAddLineToPoint(path, NULL, points[0].x, points[0].y);
                    didClosePath = NO;
                    break;
                    
                case NSBezierPathElementCurveTo:
                    CGPathAddCurveToPoint(path, NULL, points[0].x, points[0].y,
                                          points[1].x, points[1].y,
                                          points[2].x, points[2].y);
                    didClosePath = NO;
                    break;
                    
                case NSBezierPathElementClosePath:
                    CGPathCloseSubpath(path);
                    didClosePath = YES;
                    break;
            }
        }
        
        // Be sure the path is closed or Quartz may not do valid hit detection.
        if (didClosePath) {
            CGPathCloseSubpath(path);
        }
        
        immutablePath = CGPathCreateCopy(path);
        CGPathRelease(path);
    }
    
    return immutablePath;
}

-(CGPoint)startPoint {
    NSPoint points[3];
    NSBezierPathElement element = [self elementAtIndex:0 associatedPoints:points];
    
    if (element == NSBezierPathElementMoveTo) {
        return points[0];
    }
    
    return CGPointMake(4000,4000);
}

-(double)length {
    NSBezierPath *flattened_path = [self bezierPathByFlatteningPath];
    int segments = (int)flattened_path.elementCount;
    NSPoint lastPoint;
    NSPoint point;
    double length = 0;
    
    for (int i=0; i<segments; i++) {
        /*
         * Normally, elementAtIndex:associatedPoints: would set the variable
         * passed to associatedPoints as an array of NSPoints with max
         * size 3. However, since we've called bezierPathByFlatteningPath,
         * we can assume we'll always get a single point. The other points
         * are normally used as control points for bezier curves.
         */
        NSBezierPathElement e = [flattened_path elementAtIndex:i
                                              associatedPoints:&point];
        
        // e == 0 is a moveToPoint command
        if (e == 0) {
            lastPoint = point;
        }
        else {
            // distance formula
            double distance = sqrt(pow(point.x - lastPoint.x, 2) +
                                   pow(point.y - lastPoint.y, 2));
            length += distance;
            lastPoint = point;
        }
        
    }
    return length;
}

@end
