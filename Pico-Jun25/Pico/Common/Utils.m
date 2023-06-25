#import "Utils.h"

@implementation Utils

CGPoint ccpAdd(CGPoint v1,CGPoint v2)
{
    return ccp(v1.x + v2.x, v1.y + v2.y);
}

CGPoint ccpSub(CGPoint v1,CGPoint v2)
{
    return ccp(v1.x - v2.x, v1.y - v2.y);
}

CGPoint ccpMult(CGPoint v,float s)
{
    return ccp(v.x *s, v.y * s);
}

CGPoint ccpUnit(CGPoint v)
{
    return ccpMult(v,1/ccpLength(v));
}

CGFloat ccpDot(const CGPoint v1, const CGPoint v2)
{
    return v1.x*v2.x + v1.y*v2.y;
}

CGFloat ccpLengthSQ(const CGPoint v)
{
    return ccpDot(v, v);
}

CGFloat ccpLength(const CGPoint v)
{
    return sqrtf(ccpLengthSQ(v));
}

CGFloat ccpToAngleR(const CGPoint v) {
    return atan2f(v.y, v.x);
}

CGFloat ccpToAngleD(const CGPoint v) {
    double angleRadians = atan2f(v.y, v.x);
    return (angleRadians * 180 / 3.14159);
}

CGPoint ccpRotateAroundPivotByAngle(CGPoint v, CGPoint pivot, float angle)
{
    CGPoint r = ccpSub(v, pivot);
    float cosa = cosf(angle), sina = sinf(angle);
    float t = r.x;
    r.x = t*cosa - r.y*sina + pivot.x;
    r.y = t*sina + r.y*cosa + pivot.y;
    return r;
}

CGPoint ccpRotateByAngle(CGPoint v, float angle)
{
    CGPoint r = v;
    float cosa = cosf(angle), sina = sinf(angle);
    r.x = v.x*cosa - v.y*sina;
    r.y = v.x*sina + v.y*cosa;
    return r;
}

CGPoint ccpRotateWithAngle(CGPoint v, float angle)
{
    float r = ccpLength(v);
    float alpha = ccpToAngleR(v);
    float beta = angle + alpha;
    return ccp(r * cosf(beta), r * sinf(beta));
}

CGPoint ccpCross(const CGPoint v1, const CGPoint v2)
{
    return ccp(v1.x*v2.x, v1.y*v2.y);
}

+(double)radiansFromDegree:(double)degree {
    double rad = (3.14159/180) * degree;
    return rad;
}

+(double)clamp:(double)value min:(double)min max:(double)max {
    return fmin(fmax(value,min),max);
}

+(NSColor *)nsColorFromCGColor:(CGColorRef)cgColor {
    return [NSColor colorWithCIColor:[CIColor colorWithCGColor:cgColor]];
}

#pragma mark - Random

float randomFloat(float start, float end) {
    float t = (arc4random()%1000)/1000.0;
    return t*(end-start)+start;
}

int randomInt(int start, int end) {
    float t = (arc4random()%(end-start+1));
    return t + start;
}

int sign(double x) {
    if (x < 0) return -1;
    else return 1;
}


#pragma mark - String

+(NSString *)str4Int:(int)num {
    NSString *str = [NSString stringWithFormat:@"%d", num];
    return str;
}

+(NSString *)str4Integer:(NSInteger)num {
    return [NSString stringWithFormat:@"%ld", num];
}

+(NSString *)str4Double:(double)num decimals:(int)decimals {
    switch (decimals) {
        case 0:
            return [NSString stringWithFormat:@"%0.0f", num];
            break;
        case 1:
            return [NSString stringWithFormat:@"%0.1f", num];
            break;
        case 2:
            return [NSString stringWithFormat:@"%0.2f", num];
            break;
        case 3:
            return [NSString stringWithFormat:@"%0.3f", num];
            break;
        default:
            return [NSString stringWithFormat:@"%0.1f", num];;
    }
}

+ (NSString *)readResource:(NSString *)name ofType:(NSString *)type inDirectory:(NSString *)subDir {
    // only use subfolders created directly in Xcode
    NSString* path = [[NSBundle mainBundle] pathForResource:name ofType:type inDirectory:subDir];
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
}


@end
