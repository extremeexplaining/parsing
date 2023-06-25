// Parser.m
#import "References.h"


@implementation Parser

static NSArray *tokens; // in
static Token *currentToken;
static int current; // one above currentToken



#pragma mark - Main

/* reflects EBNF. Each rule should be implemented as a function
Expr = Term {+ Term}
Term = Number {* Number}
Number = digit {digit}
*/

+(Tree *)parse:(NSArray *)theTokens {
    current = 0;
    tokens = theTokens;
    [Parser advance];
    
    return [Parser expr];
}

#pragma mark - Grammer

//Expr = Term {+ Term}
+(Tree *)expr {
    Tree *leftTree = [Parser term];
    
    while ([currentToken.type EQ:@"+"]) {
        Token *opToken = currentToken;
        [Parser advance];
        Tree *rightTree = [Parser term];
        leftTree = [[BinaryTree alloc] initWith:leftTree headToken:opToken right:rightTree];
    }
    
    if([currentToken.type EQ:@"Eof"]) {
        return leftTree;
    }
    
    // identify the problem
    NSString *message = [NSString stringWithFormat:@"Unexpected character(s) %@ (code=3)", currentToken.value];
    [APPCONTROLLER error:message];
    return nil;
}

//Term = Number {* Number}
+(Tree *)term {
    Tree *leftTree = [Parser number];
    
    while ([currentToken.type EQ:@"+"]) {
        Token *opToken = currentToken;
        [Parser advance];
        Tree *rightTree = [Parser number];
        leftTree = [[BinaryTree alloc] initWith:leftTree headToken:opToken right:rightTree];
    }
    
    return leftTree;
}

//Number = digit {digit}
+(Tree *)number {
    Token *token = currentToken;
    
    if([token.type EQ:@"INT"]) {
        [Parser advance];
        return [[Leaf alloc] initWith:token];
    }
    
    // identify the problem
    if([currentToken.type EQ:@"Eof"]) {
        [APPCONTROLLER error:@"Unexpected end of file (code=4a)"];
        return nil;
    }
    
    NSString *message = [NSString stringWithFormat:@"Unexpected character(s) %@ (code=4)", currentToken.value];
    [APPCONTROLLER error:message];
    
    return nil;
}


#pragma mark - Helpers

+(Token *)advance {
    current++;
    if (current <= tokens.count) {
        currentToken = [tokens objectAtIndex:current-1];
    }
    
    return currentToken;
}

@end
