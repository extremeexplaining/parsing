#import <Foundation/Foundation.h>

@interface NSString (Utilities)

-(NSArray *)splitIntoChars;
-(NSArray *)splitIntoWords;

-(NSString *)stripFirstChar;
-(NSString *)stripLastChar;
-(NSString *)stripLastChars:(int)n;
-(NSString *)stripFirstChars:(int)n;
-(NSString *)firstChar;
-(NSString *)lastChar;
-(NSString *)firstChars:(NSUInteger)n;
-(NSString *)lastChars:(NSUInteger)n;
-(NSString *)firstWord;
-(NSString *)firstLine;

-(NSString *)stripTrailingNewlines;
-(NSString *)stripTrailingCommasAndSpaces;
-(NSString *)stripAdjecentNewlines;
-(NSString *)stripWhiteSpaceAtBothEnds;
-(NSString *)doubleSpacesIntoSingle;
-(NSString *)stripString:(NSString *)str;
-(NSString *)stripAllOccurancesOfString:(NSString *)str;
-(NSString *)stripLinesBeginningWith:(NSString *)pattern;

-(NSString *)commatize;
-(NSString *)replace:(NSString *)oldStr with:(NSString *)newStr;
-(NSString *)compress;

-(NSInteger)occurences:(NSString *)str;
-(NSInteger)indexOfSubString:(NSString *)subStr;
-(NSString *)stringBetweenStart:(NSString *)startString end:(NSString *)endString;
-(NSString *)stringTo:(NSString *)endString;
-(NSString *)insertSubString:(NSString *)subString atPosition:(int)pos;

-(NSString *)APPEND:(NSString *)other;
-(NSString *)APPENDWITHCOMMA:(NSString *)other;
-(unichar)toUnichar;

-(BOOL)EQ:(NSString *)other;
-(BOOL)isNum;
-(BOOL)isOp;
-(BOOL)isOpOrParen;
-(BOOL)isEmpty;
-(BOOL)isSingleLetter;
-(BOOL)isLetter;

@end
