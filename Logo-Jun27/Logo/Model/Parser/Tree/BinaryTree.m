// BinaryOpNode.m
#import "References.h"

@implementation BinaryTree

-(id)initWith:(Tree *)leftTree headToken:(Token *)headToken right:(Tree *)rightTree {
    
    self=[super init];
    if (self!=nil) {
        _leftTree = leftTree;
        _rightTree = rightTree;
        self.headToken = headToken;
    }
    
    return self;
}

-(NSString *)evaluate {
    NSString *left = [Evaluator evaluate:_leftTree];
    NSString *right = [Evaluator evaluate:_rightTree];
    
    if([self.headToken.type EQ:@"+"]) {
        return [left APPEND:right];
    }
    
    if([self.headToken.type EQ:@"R"]) {
        int leftNum = [left intValue];
        
        NSString *rightStr = @"";
        for (int i=0; i<leftNum; i++) {
            NSString *str = [Evaluator evaluate:_rightTree];
            rightStr = [rightStr APPEND:str];
        }
        
        return rightStr;
    }
    
    return nil;
}

#pragma mark - Description

-(NSString *)description {
    return [NSString stringWithFormat:@"%@(%@, %@)", self.headToken.value, _leftTree, _rightTree];
}

@end
