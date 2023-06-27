#import "ReadText.h"

@implementation ReadText


#pragma mark - Data from external txt file

+(NSString *)stringForFilename:(NSString *)filename ofType:(NSString *)type class:(Class)class {
    NSString* path = [[NSBundle bundleForClass:class] pathForResource:filename ofType:type];
    NSString *textRaw = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    return textRaw;
}

+(NSArray *)arrayForFilename:(NSString *)filename ofType:(NSString *)type class:(Class)class {
    return [self linesForFilename:filename ofType:type class:class];
}

// if only two strings then the first is key, and the other is value
+(NSDictionary *)simpleDictForFilename:(NSString *)filename ofType:(NSString *)type class:(Class)class {
    NSArray *lines = [self linesForFilename:filename ofType:type class:class];
    
    NSMutableDictionary *muteDict = [[NSMutableDictionary alloc] init];
    for (NSString *line in lines) {
        NSArray *lineArray = [line componentsSeparatedByString:@","];
        NSString *key = lineArray[0];
        NSString *value = lineArray[1];
        [muteDict setObject:value forKey:key];
    }

    NSDictionary *dict = [NSDictionary dictionaryWithDictionary:muteDict];    
    return dict;
}


// second csv is key, and the other csv;s are packaged into an array which then becomes the value
+(NSDictionary *)dictForFilename:(NSString *)filename ofType:(NSString *)type class:(Class)class {
    NSArray *lines = [self linesForFilename:filename ofType:type class:class];
    NSMutableDictionary *muteDict = [[NSMutableDictionary alloc] init];
    
    for (NSString *line in lines) {
        NSArray *lineArray = [line componentsSeparatedByString:@","];
        NSString *key = lineArray[0];
        NSRange theRange;
        theRange.location = 1; theRange.length = [lineArray count]-1;
        NSArray *subArray = [lineArray subarrayWithRange:theRange];
        [muteDict setObject:subArray forKey:key];
    }
    
    return [NSDictionary dictionaryWithDictionary:muteDict];
}

+(NSArray *)linesForFilename:(NSString *)filename ofType:(NSString *)type class:(Class)class {
    NSString* path = [[NSBundle bundleForClass:class] pathForResource:filename ofType:type];
    NSString *textRaw = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    NSMutableArray *result = [[textRaw componentsSeparatedByString:@"\n"] mutableCopy];
    
    if([[result lastObject] EQ:@""]) {
        [result removeLastObject];
    }
    
    return result;
}


@end
