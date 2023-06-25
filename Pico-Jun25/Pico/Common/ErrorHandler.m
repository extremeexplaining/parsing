#import "ErrorHandler.h"

@implementation ErrorHandler

+(void)error:(NSString *)msg {
    msg = [NSString stringWithFormat:@"ERROR: %@", msg];
    logStr(msg);
    NSBeep();
}

@end
