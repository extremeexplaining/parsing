//Token.m
#import "References.h"

@implementation Token

-(id)initWith:(NSString *)type value:(NSString *)value {
    
    self=[super init];
    if (self!=nil) {
        _type = type;
        _value = value;
    }
    
    return self;
}


#pragma mark - Description

-(NSString *)description {
    // type
    NSString *result = _type;
    
    // value
    if ([_type EQ:@"INT"]) {
        result = [result APPEND:@":"];
        result = [result APPEND:_value];
    }
   
    return result;
}

@end
