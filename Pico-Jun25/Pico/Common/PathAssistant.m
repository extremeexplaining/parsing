#import "PathAssistant.h"

@implementation PathAssistant

#pragma mark - Relative Transformation

+(NSBezierPath *)translatePath:(NSBezierPath *)bezierPath byPosition:(CGPoint)point {
    NSAffineTransform *translateTransform = [self translate:point];
    return [translateTransform transformBezierPath:bezierPath];
}

+(NSBezierPath *)scalePath:(NSBezierPath *)bezierPath byFactor:(double)factor {
    return [self scalePath:bezierPath byScale:ccp(factor, factor)];
}

+(NSBezierPath *)scalePath:(NSBezierPath *)bezierPath byScale:(CGPoint)factor {
    NSAffineTransform *scaleTransform = [self scale:factor];
    return [scaleTransform transformBezierPath:bezierPath];
}

// angle should be in radians
+(NSBezierPath *)rotatePath:(NSBezierPath *)bezierPath byAngle:(double)angle {
    NSAffineTransform *rotationTransform = [self rotate:angle];
    return [rotationTransform transformBezierPath:bezierPath];
}


#pragma mark - Affine Transform

+(NSAffineTransform *)translate:(CGPoint)point {
    NSAffineTransform *translate = [NSAffineTransform transform];
    [translate translateXBy:point.x yBy:point.y];
    return translate;
}

+(NSAffineTransform *)scale:(CGPoint)factor {
    NSAffineTransform *scaleTransform = [NSAffineTransform transform];
    [scaleTransform scaleXBy:factor.x yBy:factor.y];
    return scaleTransform;
}

+(NSAffineTransform *)rotate:(double)angle {
    NSAffineTransform *transform = [NSAffineTransform transform];
    [transform rotateByRadians:angle];
    return transform;
}


#pragma mark - Helpers

+(CGPoint)pathOrigin:(NSBezierPath *)bezierPath {
    CGPathRef pathRef = [bezierPath quartzPath];
    CGRect rect = CGPathGetPathBoundingBox(pathRef);
    return rect.origin;
}

+(CGSize)pathSize:(NSBezierPath *)bezierPath {
    CGPathRef pathRef = [bezierPath quartzPath];
    CGRect rect = CGPathGetPathBoundingBox(pathRef);
    return rect.size;
}


@end
