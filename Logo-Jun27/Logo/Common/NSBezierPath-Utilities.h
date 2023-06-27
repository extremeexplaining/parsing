#import <Cocoa/Cocoa.h>

@interface NSBezierPath (Utilities)

+ (NSBezierPath *)bezierPathFromCGPath:(CGPathRef)cgPath;
-(CGPathRef)quartzPath;
-(CGPoint)startPoint;
-(double)length;

@end
