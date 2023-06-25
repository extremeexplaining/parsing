// Evaluator.m
#import "References.h"

@implementation Evaluator

+(NSString *)evaluate:(Tree *)tree {
    if(!tree) {
        return nil;
    }
    
    logObject(tree);
    NSString *result = [tree evaluate];
    logObject(result);
    
    return result;

}
@end
