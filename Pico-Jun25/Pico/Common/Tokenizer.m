#import "Tokenizer.h"

@implementation Tokenizer

+(NSArray *)tokenize:(NSString *)str delimiters:(NSCharacterSet *)delimiters {
    NSMutableArray *tokenArray = [[NSMutableArray alloc] init];
    NSString *expression = str;
    NSString *chr = @"";
    NSString *lhs = @"";
    NSString *rhs = expression;
    
    NSRange range = [expression rangeOfCharacterFromSet:delimiters];
    
    while (range.location != NSNotFound) {
        chr = [expression substringWithRange:range];
        lhs = [expression substringToIndex:range.location];
        rhs = [expression substringFromIndex:range.location+1];
        
        if (lhs.length > 0) {
            [tokenArray addObject:lhs];
        }
        
        if (![chr isEqualToString:@" "]) {
            [tokenArray addObject:chr];
        }
        
        expression = rhs;
        range = [expression rangeOfCharacterFromSet:delimiters];
    }
    
    if (expression.length > 0) {
        [tokenArray addObject:expression];
    }
    
    return tokenArray;
}

@end
