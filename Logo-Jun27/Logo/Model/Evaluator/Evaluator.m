// Evaluator.m
#import "References.h"

@implementation Evaluator

+(NSString *)evaluate:(Tree *)tree {
    if(!tree) {
        return nil;
    }
    
    NSString *result = [tree evaluate];
    
    return result;


}

@end
