// Parser.h
#import "Common.h"
@class Tree;

@interface Parser : NSObject

+(Tree *)parse:(NSArray *)theTokens;

@end
