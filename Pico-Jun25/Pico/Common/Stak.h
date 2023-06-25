#import "Common.h"

@interface Stak : NSObject

@property (strong) NSMutableArray *stackArray;

-(id)initWithReversedArray:(NSArray *)arr;
-(void)push:(id)object; // push from under
-(void)push:(id)object at:(int)i;
-(void)press:(id)object; // push from top
-(id)pop;
-(id)plop; // pop of last
-(id)popAt:(int)i;
-(id)peek;
-(id)peekAt:(int)i;
-(BOOL)empty;
-(void)flush;
-(int)count;

@end
