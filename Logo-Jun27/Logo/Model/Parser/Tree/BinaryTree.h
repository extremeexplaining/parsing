// BinaryNode.h
#import "Common.h"

@interface BinaryTree : Tree

@property (strong) Tree *leftTree;
@property (strong) Tree *rightTree;

-(id)initWith:(Tree *)leftTree headToken:(Token *)headToken right:(Tree *)rightTree;

@end
