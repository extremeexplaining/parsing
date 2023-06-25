// BinaryTree.h
#import "Common.h"

@interface BinaryTree : Tree

@property (strong) Tree *leftSubTree;
@property (strong) Tree *rightSubTree;

-(id)initWith:(Tree *)leftSubTree headToken:(Token *)headToken right:(Tree *)rightSubTree;

@end
