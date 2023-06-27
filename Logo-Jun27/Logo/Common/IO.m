#import "IO.h"

@implementation IO

+ (void)writeToFile:(NSString *)path fromStr:(NSString *)str {
    NSError *error = nil;
    [str writeToFile:path atomically:YES
                            encoding:NSUTF8StringEncoding error:&error];
     if (error) {
          NSLog(@":: Fail: %@", [error localizedDescription]);
     }
}

+ (NSString *)readFromFile:(NSString *)path {
    NSError *error = nil;
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
         NSLog(@":: Fail: %@", [error localizedDescription]);
    }
    
    return str;
}

@end
