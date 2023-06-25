#import "Common.h"

@interface Tokenizer : NSObject

+(NSArray *)tokenize:(NSString *)str delimiters:(NSCharacterSet *)delimiters;

@end
