#import "AppController.h"
#import "Scanner.h"
#import "Token.h"
#import "Parser.h"
#import "Tree.h"
#import "Leaf.h"
#import "UnaryTree.h"
#import "BinaryTree.h"
#import "Evaluator.h"


#pragma mark - Abbreviations
#define APP (AppDelegate *)[NSApp delegate]
#define APPCONTROLLER [APP appController]
#define NOTFOUND -99999

