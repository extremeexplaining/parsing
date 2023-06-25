#import "Common.h"

@interface Modifiers : NSObject

+(void)setModifiers:(NSEvent *)theEvent;
+(void)updateModifierKeys;
+(BOOL) shiftKeyDown;
+(BOOL) optionKeyDown;
+(BOOL) controlKeyDown;
+(BOOL) commandKeyDown;


@end
