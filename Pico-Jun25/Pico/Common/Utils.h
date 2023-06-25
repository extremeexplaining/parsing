#import "Common.h"

@interface Utils : NSObject

+(NSString *)str4Int:(int)num;
+(NSString *)str4Integer:(NSInteger)num;
+(NSString *)str4Double:(double)num decimals:(int)decimals;
+(NSString *)readResource:(NSString *)name ofType:(NSString *)type inDirectory:(NSString *)subDir;
+(double)radiansFromDegree:(double)degree;
+(double)clamp:(double)value min:(double)min max:(double)max;
+(NSColor *)nsColorFromCGColor:(CGColorRef)cgColor;

CGPoint ccpAdd(CGPoint v1, CGPoint v2);
CGPoint ccpSub(CGPoint v1, CGPoint v2);
CGPoint ccpMult(CGPoint v, float s);
CGPoint ccpUnit(CGPoint v);
CGFloat ccpDot(const CGPoint v1, const CGPoint v2);
CGFloat ccpLengthSQ(const CGPoint v);
CGFloat ccpLength(const CGPoint v);
CGFloat ccpToAngleR(const CGPoint v); // R = Radians
CGFloat ccpToAngleD(const CGPoint v); // D = Degrees
CGPoint ccpRotateAroundPivotByAngle(CGPoint v, CGPoint pivot, float angle);
CGPoint ccpRotateByAngle(CGPoint v, float angle);
CGPoint ccpCross(const CGPoint v1, const CGPoint v2);

float randomFloat(float start, float end);
int randomInt(int start, int end);
int sign(double x);



@end
