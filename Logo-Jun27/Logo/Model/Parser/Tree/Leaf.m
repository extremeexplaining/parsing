// NumberNode.m
#import "References.h"

@implementation Leaf

-(id)initWith:(Token *)theToken {
    
    self=[super init];
    if (self!=nil) {
        self.headToken = theToken;
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
