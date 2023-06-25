#import "Common.h"

@interface ReadText : NSObject

+(NSString *)stringForFilename:(NSString *)filename ofType:(NSString *)type class:(Class)class;
+(NSArray *)arrayForFilename:(NSString *)filename ofType:(NSString *)type class:(Class)class;
+(NSDictionary *)dictForFilename:(NSString *)filename ofType:(NSString *)type class:(Class)class;
+(NSDictionary *)simpleDictForFilename:(NSString *)filename ofType:(NSString *)type class:(Class)class;
+(NSArray *)linesForFilename:(NSString *)filename ofType:(NSString *)type class:(Class)class;

@end
