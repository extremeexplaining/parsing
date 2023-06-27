#import "References.h"

@implementation UnaryTree

-(id)initWith:(Token *)headToken subTree:(Tree *)tree {
    self=[super init];
    if (self!=nil) {
        _subtree = tree;
        self.headToken = headToken;
    }
    
    return self;
}

-(NSString *)evaluate {
    NSString *num = [Evaluator evaluate:_subtree];
    
    if([self.headToken.type EQ:@"F"]) {
        return [NSString stringWithFormat:@"forward %@; ", num];
    }
    
    if([self.headToken.type EQ:@"T"]) {
        return [NSString stringWithFormat:@"turn %@; ", num];
    }
    
    return nil;
}

#pragma mark - Description

-(NSString *)description {
    return [NSString stringWithFormat:@"%@%@", self.headToken.value, _subtree];
}


@end
