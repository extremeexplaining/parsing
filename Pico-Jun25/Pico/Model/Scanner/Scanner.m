// Scanner.m
#import "References.h"

@implementation Scanner

static NSString *source; // in
static NSMutableArray *tokens; // out
static int start; // start of the currentToken
static int current; // one above the currentToken, (the beginning of the next token)

#pragma mark - Init

+(void)initialize {
    tokens = [[NSMutableArray alloc] init];
}

#pragma mark - Main
+(NSArray *)scan:(NSString *)theSource {
    [tokens removeAllObjects];
    start = 0;
    current = 0;
    source = theSource;
    return [Scanner scanTokens];
}

+(NSArray *)scanTokens {
    while (![Scanner isAtEnd]) {
        start = current;
        [Scanner scanToken];
    }
    
    // add Eof token as the last token
    Token *eofToken = [[Token alloc] initWith:@"Eof" value:@""];
    [tokens addObject:eofToken];
    
    return tokens;
}

+(void)scanToken {
    // A unichar is a 16-bit integer used to represent the characters.
    unichar c = [self advance];
    
    switch (c) {
        // Single-character tokens.
        case '+': [Scanner addToken:@"+"]; break;
        case '*': [Scanner addToken:@"*"]; break;
          
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
                NSString *message = [NSString stringWithFormat:@"Unexpected character %C (code=1)", c];
                [APPCONTROLLER error:message];
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
