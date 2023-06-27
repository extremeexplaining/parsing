#import <Cocoa/Cocoa.h>

@interface IO : NSObject

+ (void)writeToFile:(NSString *)path fromStr:(NSString *)str;
+ (NSString *)readFromFile:(NSString *)path;

@end
