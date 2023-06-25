// Tree.h
#import "Common.h"

// Abstract class

@interface Tree : NSObject

@property Token *headToken;

-(NSString *)evaluate;

@end
