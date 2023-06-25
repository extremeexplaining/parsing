#import "Common.h"

@interface PathAssistant : NSObject

+(NSBezierPath *)translatePath:(NSBezierPath *)bezierPath byPosition:(CGPoint)pos;
+(NSBezierPath *)scalePath:(NSBezierPath *)bezierPath byFactor:(double)factor;
+(NSBezierPath *)scalePath:(NSBezierPath *)bezierPath byScale:(CGPoint)factor;
+(NSBezierPath *)rotatePath:(NSBezierPath *)bezierPath byAngle:(double)angle; // not used at the moment

@end


/*
    Translates, scales and rotates Bezier paths.
*/
