//Token.m
#import "References.h"

@implementation Token

-(id)initWith:(NSString *)type value:(NSString *)theValue{
    
    self=[super init];
    if (self!=nil) {
        _type = type;
        _value = theValue;
    }
    
    return self;
}


#pragma mark - Description

-(NSString *)description {
    NSString *result = @"";
    
    // tokenType
    result = [result APPEND:_type];
    
    // value
    if ([_type EQ:@"INT"]) {
        result = [result APPEND:@":"];
        result = [result APPEND:_value];
    }
   
    return result;
}

@end
