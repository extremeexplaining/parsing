// BinaryTree.m
#import "References.h"

@implementation BinaryTree

-(id)initWith:(Tree *)leftSubTree headToken:(Token *)headToken right:(Tree *)rightSubTree {
    
    self=[super init];
    if (self!=nil) {
        _leftSubTree = leftSubTree;
        _rightSubTree = rightSubTree;
        self.headToken = headToken;
    }
    
    return self;
}

-(NSString *)evaluate {
    NSString *left = [Evaluator evaluate:_leftSubTree];
    NSString *right = [Evaluator evaluate:_rightSubTree];
    
    int leftInt = [left intValue];
    int rightInt = [right intValue];
    
    if([self.headToken.type EQ:@"+"]) {
        int resultInt = leftInt + rightInt;
        NSString *result = [NSString stringWithFormat:@"%d", resultInt];
        return result;
    }
    
    if([self.headToken.type EQ:@"*"]) {
        int resultInt = leftInt * rightInt;
        NSString *result = [NSString stringWithFormat:@"%d", resultInt];
        return result;
    }
    
    return nil;
}

#pragma mark - Description

-(NSString *)description {
    return [NSString stringWithFormat:@"%@(%@, %@)", self.headToken.value, _leftSubTree, _rightSubTree];
}

@end
