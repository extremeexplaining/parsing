// Parser.m
#import "References.h"


@implementation Parser

static NSArray *tokens; // incoming
static Token *currentToken;
static int current; // one above currentToken, (nextToken)


#pragma mark - Main

/* reflects EBNF. Each rule should be implemented as a function
 Program = Command {+ Command}
 Command = F Number | T Number | R Number [ InnerProgram ]
 InnerProgram = Command {+ Command}
 Number = digit {digit}
*/

+(Tree *)parse:(NSArray *)theTokens {
    // reset
    current = 0;
    tokens = theTokens;
    [Parser advanceToken];
    
    return [Parser program];
}

#pragma mark - Grammer

// Program = Command {+ Command} Eof
+(Tree *)program {
    Tree *left = [Parser command];
    
    while ([currentToken.type EQ:@"+"]) {
        Token *opToken = currentToken;
        [Parser advanceToken];
        Tree *right = [Parser command];
        left = [[BinaryTree alloc] initWith:left headToken:opToken right:right];
    }
    
    if([currentToken.type EQ:@"Eof"] ) {
        return left;
    }
    
    [APPCONTROLLER error:@"Invalid Syntax (code=3)"];
    return nil;
}

// Command = F Number | T Number | R [ Program ]
+(Tree *)command {
    if ([currentToken.type EQ:@"F"] || [currentToken.type EQ:@"T"]) {
        Token *headToken = currentToken;
        [Parser advanceToken];
        Tree *numTree = [Parser number];
        Tree *unaryTree = [[UnaryTree alloc] initWith:headToken subTree:numTree];
        return unaryTree;
    }
    
    if ([currentToken.type EQ:@"R"]) {
        Token *headToken = currentToken;
        [Parser advanceToken];
        Tree *numTree = [Parser number];
        
        if(![Parser match:@"["]) return nil;
        
        Tree *right = [self innerProgram];
        
        if(![Parser match:@"]"]) return nil;
        
        Tree *binaryTree = [[BinaryTree alloc] initWith:numTree headToken:headToken right:right];
        return binaryTree;
    }
    
    [APPCONTROLLER error:@"Syntax error (code=8)"];
    return nil;
}

// InnerProgram = Command {+ Command}
+(Tree *)innerProgram {
    Tree *left = [Parser command];
    
    while ([currentToken.type EQ:@"+"]) {
        Token *opToken = currentToken;
        [Parser advanceToken];
        Tree *right = [Parser command];
        left = [[BinaryTree alloc] initWith:left headToken:opToken right:right];
    }
    
    if([currentToken.type EQ:@"]"]) {
        return left;
    }
    
    [APPCONTROLLER error:@"Invalid Syntax (code=7)"];
    return nil;
}

+(Tree *)number {
    Token *tok = currentToken;
    
    if([tok.type EQ:@"INT"]) {
        [Parser advanceToken];
        return [[Leaf alloc] initWith:tok];
    }
    
    [APPCONTROLLER error:@"Invalid Syntax (code=4)"];
    
    return nil;
}


#pragma mark - Helpers

+(Token *)advanceToken {
    current++;
    if (current <= tokens.count) {
        currentToken = [tokens objectAtIndex:current-1];
    }
    
    return currentToken;
}

+(BOOL)match:(NSString *)type {
    if ([self check:type]) {
      [self advanceToken];
      return true;
    }
    
    NSString *message = [NSString stringWithFormat:@"Expected %@, but got %@  (code=7)", type, currentToken.type];
    [APPCONTROLLER error:message];

    return false;
}


+(BOOL)check:(NSString *)type {
    
if ([self isEof]) {
      return false;
    }

    return [currentToken.type EQ:type];
}

+(BOOL)isEof {
    return [currentToken.type EQ:@"Eof"];
}

@end
