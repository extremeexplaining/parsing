#import "NSString-Utilities.h"

@implementation NSString (Utilities)

- (NSArray *)splitIntoChars {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (int i=0; i<self.length; i++) {
        NSString *newChar = [self substringWithRange:NSMakeRange(i, 1)];
        [array addObject:newChar];
    }
    
    return array;
}

- (NSArray *)splitIntoWords {
    return [self componentsSeparatedByString:@" "];
}

-(NSString *)stripLastChar {
    return [self stripLastChars:1];
}

-(NSString *)stripLastChars:(int)n {
    if (self.length <= n) {
        return nil;
    }
    
    return [self substringToIndex:self.length-n];
}

-(NSString *)stripFirstChar {
    return [self stripFirstChars:1];
}

-(NSString *)stripFirstChars:(int)n {
    if (self.length <= n ) {
        return nil;
    }
    
    return [self substringFromIndex:n];
}

-(NSString *)stripString:(NSString *)str {
    NSRange range = [self rangeOfString:str];
    NSString *lhs = [self substringToIndex:range.location];
    NSString *rhs = [self substringFromIndex:range.location + range.length];
    str = [lhs stringByAppendingString:rhs];
    return str;
}

-(NSString *)stripAllOccurancesOfString:(NSString *)str {
    return [self stringByReplacingOccurrencesOfString:str withString:@""];
}

-(NSString *)firstChar {
    return [self firstChars:1];
}

-(NSString *)firstChars:(NSUInteger)n {
    if (self.length<n) {
        return self;
    }
    
    return [self substringToIndex:n];
}

-(NSString *)lastChar {
    return [self lastChars:1];
}

-(NSString *)lastChars:(NSUInteger)n {
    if (self.length<n) {
        return nil;
    }
    
    return [self substringFromIndex:self.length-n];
}

-(NSString *)firstWord {
    NSArray *arr = [self componentsSeparatedByString:@" "];
    
    if (arr.count > 0) {
        return arr[0];
    }
    
    return nil;
}

-(NSString *)firstLine {
    NSArray *arr = [self componentsSeparatedByString:@"\n"];
    
    if (arr.count > 0) {
        return arr[0];
    }
    
    return nil;
}

-(NSString *)commatize {
    if (self.length<2) {
        return self;
    }
    
    NSString *str = @"";
    
    for (int i=0; i<self.length; i++) {
        str = [str stringByAppendingString:[self substringWithRange:NSMakeRange(i, 1)]];
        str = [str stringByAppendingString:@","];
    }
    
    return [str stripLastChar];
}

-(NSString *)replace:(NSString *)oldStr with:(NSString *)newStr {
    return [self stringByReplacingOccurrencesOfString:oldStr withString:newStr];
}

//  returns a string where all spaces, newLines and tabs are removed.
-(NSString *)compress {
    NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
}

-(NSString *)stripTrailingNewlines {
    NSString *str = self;
    while ([[str lastChar] isEqualToString:@"\n"]) {
        str = [str stripLastChar];
    }
    
    return str;
}

-(NSString *)stripTrailingCommasAndSpaces {
    NSString *str = self;
    while ([[str lastChar] isEqualToString:@","] || [[str lastChar] isEqualToString:@" "]) {
        str = [str stripLastChar];
    }
    
    return str;
}

-(NSString *)stripAdjecentNewlines {
    NSString *str = self;
    while ([str containsString:@"\n\n"]) {
        str = [str stringByReplacingOccurrencesOfString:@"\n\n" withString:@"\n"];
    }
    
    return str;
}

-(NSString *)stripWhiteSpaceAtBothEnds {
    return [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
}


-(NSString *)doubleSpacesIntoSingle {
    NSString *str = self;
    while ([str containsString:@"  "]) {
        str = [str replace:@"  " with:@" "];
    }
    
    return str;
}

-(NSString *)stripLinesBeginningWith:(NSString *)pattern {
    NSArray *arr = [self componentsSeparatedByString:@"\n"];
    NSMutableArray *lines = [arr mutableCopy];
    
    for (NSString *line in arr) {
        NSString *lineStart = [line firstChars:pattern.length];
        if ([lineStart isEqualToString:pattern]) {
            [lines removeObject:line];
        }
    }
    
    NSString *result = [lines componentsJoinedByString:@"\n"];
    return result;
}

-(NSInteger)occurences:(NSString *)str {
    NSInteger strCount = [self length] - [[self stringByReplacingOccurrencesOfString:str withString:@""] length];
    return strCount / [str length];
}

-(NSInteger)indexOfSubString:(NSString *)subStr {
    NSRange range = [self rangeOfString:subStr];
    return range.location;
}

-(NSString *)stringBetweenStart:(NSString *)startString end:(NSString *)endString {
    NSString *str = self;
    NSInteger startInt = [str indexOfSubString:startString];
    str = [str substringFromIndex:startInt+startString.length];
    
    NSInteger endInt = [str indexOfSubString:endString];
    
    str = [str substringToIndex:endInt];
    
    return str;
}

-(NSString *)stringTo:(NSString *)endString {
    NSString *str = self;
    NSInteger endInt = [str indexOfSubString:endString];
    str = [str substringToIndex:endInt];
    
    return str;
}

-(NSString *)insertSubString:(NSString *)subString atPosition:(int)pos {
    NSString *motherString = self;
    
    if  (pos > motherString.length) {
        pos = (int) motherString.length;
    }
    
    int num = (int) (motherString.length-pos);
    NSString *last = [motherString lastChars:num];
    
    NSString *outString = [motherString firstChars:pos];
    outString = [outString stringByAppendingString:subString];
    outString = [outString stringByAppendingString:last];
    
    return outString;
}

-(NSString *)APPEND:(NSString *)other {
    return [self stringByAppendingString:other];
}

-(NSString *)APPENDWITHCOMMA:(NSString *)other {
    NSString *str = [NSString stringWithFormat:@",%@", other];
    return [self stringByAppendingString:str];
}

-(BOOL)EQ:(NSString *)other {
    return [self isEqualToString:other];
}

-(BOOL)isNum {
    NSCharacterSet *numericSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet* notNumeric= [numericSet invertedSet];
    
    if ([self rangeOfCharacterFromSet:notNumeric].location == NSNotFound) {
        return YES;
    }
    
    return NO;
}

-(BOOL)isOp {
    NSCharacterSet *numericSet = [NSCharacterSet characterSetWithCharactersInString:@"_^/*"];
    NSCharacterSet* notNumeric= [numericSet invertedSet];
    
    if ([self rangeOfCharacterFromSet:notNumeric].location == NSNotFound) {
        return YES;
    }
    
    return NO;
}

-(BOOL)isOpOrParen {
    NSCharacterSet *numericSet = [NSCharacterSet characterSetWithCharactersInString:@"_^/*()"];
    NSCharacterSet* notNumeric= [numericSet invertedSet];
    
    if ([self rangeOfCharacterFromSet:notNumeric].location == NSNotFound) {
        return YES;
    }
    
    return NO;
}

-(BOOL)isEmpty {
    if(self.length == 0 ) {
        return YES;
    }
    
    return NO;
}

-(BOOL)isSingleLetter {
    NSString *letters = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    
    if([letters containsString:self] && self.length == 1) {
        return YES;
    }
    
    return NO;
}

-(unichar)toUnichar {
    return [self characterAtIndex:0];
}

-(BOOL)isLetter {
    if(self.length != 1) {
        return false;
    }
    
    NSString *lowercaseLetters = @"abcdefghijklmnopqrstuvwxyz";
    NSString *uppercaseLetters = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSString *letters = [uppercaseLetters APPEND:lowercaseLetters];
    
    if([letters containsString:self]) {
        return true;
    }
    return false;
}

@end
