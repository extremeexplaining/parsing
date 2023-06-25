#import "Common.h"

@implementation Global
static int mode;

#pragma mark - Mode
+(void)setMode:(int)theMode {
    mode = theMode;
}

+(int)mode {
    return mode;
}

@end
