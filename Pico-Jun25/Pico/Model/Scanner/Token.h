//Token.h
#import "Common.h"

@interface Token : NSObject

@property (assign) NSString *type;
@property (strong) NSString *value;

-(id)initWith:(NSString *)type value:(NSString *)value;

@end
