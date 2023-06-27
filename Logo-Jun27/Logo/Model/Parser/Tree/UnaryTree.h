#import "Common.h"

@interface UnaryTree : Tree

@property (strong) Tree *subtree;

-(id)initWith:(Token *)headToken subTree:(Tree *)tree;

@end
