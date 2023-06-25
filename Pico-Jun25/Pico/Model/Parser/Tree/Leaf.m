// Leaf.m
#import "References.h"

@implementation Leaf

-(id)initWith:(Token *)headToken {
    
    self=[super init];
    if (self!=nil) {
        self.headToken = headToken;
    }
    
    return self;
}

-(NSString *)evaluate {
    return self.headToken.value;
}

#pragma mark - Description

-(NSString *)description {
    return self.headToken.value;
}

@end
