// AppController.m
#import "References.h"


@implementation AppController

NSArray *tokens;
Tree *ast;

#pragma mark - Run

-(IBAction)runButtonClicked:(id)sender {
    // reset all fields except the source field
    _tokensField.string = @"";
    _errorField.string = @"";
    _astField.string = @"";
    _resultField.string = @"";
    
    if (_sourceField.string.length == 0) {
        _errorField.string = @"Source is empty (code=0)";
    }
    
    if([self foundError]) return;
    [self scan];
    
    if([self foundError]) return;
    [self parse];
    
    if([self foundError]) return;
    [self evaluate];
}

#pragma mark - Scan

-(void)scan {
    // produce tokens
    tokens = [Scanner scan:_sourceField.string];

    // show tokens
    _tokensField.string = [self stringFromTokens];
}

// show tokens
-(NSString *)stringFromTokens {
    NSString *result = @"";
    
    for (Token *token in tokens) {
        NSString *tokenString = [NSString stringWithFormat:@"%@", token];
        result = [result APPEND:tokenString];
        result = [result APPEND:@", "];
    }
    
    return [result stripTrailingCommasAndSpaces];
}

#pragma mark - Parse

-(void)parse {
    // produce AST
    ast = [Parser parse:tokens];
    
    // show ast
    _astField.string = [self stringFromAst];
}

-(NSString *)stringFromAst {
    return [NSString stringWithFormat:@"%@", ast];
}

#pragma mark - Evaluate

-(void)evaluate {
    // produce result
    NSString *result = [Evaluator evaluate:ast];
    
    if(result == nil) {
        _errorField.string = @"Runtime error (code=5)";
    }
    
    // show tokens
    _resultField.string = result;
}

#pragma mark - Error

-(void)error:(NSString *)message {
    // we only show the first error
    if(_errorField.string.length == 0) {
        _errorField.string = message;
    } 
}

-(BOOL)foundError {
    return (_errorField.string.length > 0);
}

@end
