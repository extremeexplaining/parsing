// Scanner.m
#import "References.h"

@implementation Scanner

static NSString *source;
static NSMutableArray *tokens;
static int start;
static int current;

#pragma mark - Init

+ (void)initialize {
    tokens = [[NSMutableArray alloc] init];
    [Scanner reset];
}

+(void)reset {
    [tokens removeAllObjects];
    start = 0;
    current = 0;
}

#pragma mark - Main
+(NSArray *)scan:(NSString *)str {
    [self reset];
    source = str;
    return [Scanner scanTokens];
}

+(NSArray *)scanTokens {
    while (![Scanner isAtEnd]) {
        start = current;
        [Scanner scanToken];
    }
    
    Token *eofToken = [[Token alloc] initWith:@"Eof" value:@""];
    [tokens addObject:eofToken];
    
    return tokens;
}

+(void)scanToken {
    // A unichar is a 16-bit unsigned integer type used to represent the characters.
    unichar c = [self advance];
    
    switch (c) {
        // Single-character tokens.
        case '+': [Scanner addToken:@"+"]; break;
        case 'F': [Scanner addToken:@"F"]; break;
        case 'T': [Scanner addToken:@"T"]; break;
        case 'R': [Scanner addToken:@"R"]; break;
        case '[': [Scanner addToken:@"["]; break;
        case ']': [Scanner addToken:@"]"]; break;
          
        // Ignore whitespace.
        case ' ':
        case '\r':
        case '\t':
        case '\n':
        break;

        default:
            if ([Scanner isDigit:c]) {
                [Scanner number];
            } else {
                [APPCONTROLLER error:@"Unexpected character (code=2)"];
                
            }
        break;
    }
}

+(void)addToken:(NSString *)type {
    NSString *value = [source substringWithRange:NSMakeRange(start, current-start)];
    Token *token = [[Token alloc] initWith:type value:value];
    [tokens addObject:token];
}

#pragma mark - Literals

+(void)number {
    while ([self isDigit:[self peek]]) [self advance];
    
    [Scanner addToken:@"INT"];
}


#pragma mark - Helpers

+(BOOL)isAtEnd {
    return (current >= source.length);
}

+(unichar)advance {
    current++;
    return [source characterAtIndex:current-1];
}

+(unichar)peek {
    if ([self isAtEnd]) return '\0';
    
    return [source characterAtIndex:current];
}

+(BOOL)isDigit:(unichar)c {
     return c >= '0' && c <= '9';
}


@end
