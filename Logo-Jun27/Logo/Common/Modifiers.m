#import "Modifiers.h"

static BOOL shiftKeyDown;
static BOOL optionKeyDown;
static BOOL controlKeyDown;
static BOOL commandKeyDown;

@implementation Modifiers

+(void)initialize {
    shiftKeyDown = NO;
    optionKeyDown = NO;
    controlKeyDown = NO;
    commandKeyDown = NO;
}

#pragma mark - Modifiers

+(void)setModifiers:(NSEvent *)theEvent {
    shiftKeyDown = NO;
    optionKeyDown = NO;
    controlKeyDown = NO;
    commandKeyDown = NO;
    
    if ([theEvent modifierFlags] & NSEventModifierFlagShift) {
        shiftKeyDown = YES;
    }
    
    if ([theEvent modifierFlags] & NSEventModifierFlagOption) {
        optionKeyDown = YES;
    }
    
    if ([theEvent modifierFlags] & NSEventModifierFlagControl) {
        controlKeyDown = YES;
    }
    
    if ([theEvent modifierFlags] & NSEventModifierFlagCommand) {
        commandKeyDown = YES;
    }
}

+(void)updateModifierKeys {
    shiftKeyDown = NO;
    optionKeyDown = NO;
    controlKeyDown = NO;
    commandKeyDown = NO;
    
    if ([NSEvent modifierFlags] & NSEventModifierFlagShift) {
        shiftKeyDown = YES;
    }
    
    if ([NSEvent modifierFlags] & NSEventModifierFlagOption) {
        optionKeyDown = YES;
    }
    
    if ([NSEvent modifierFlags] & NSEventModifierFlagControl) {
        controlKeyDown = YES;
    }
    
    if ([NSEvent modifierFlags] & NSEventModifierFlagCommand) {
        commandKeyDown = YES;
    }
}

+(BOOL) shiftKeyDown {
    return shiftKeyDown;
}

+(BOOL) optionKeyDown {
    return optionKeyDown;
}

+(BOOL) controlKeyDown {
    return controlKeyDown;
}

+(BOOL) commandKeyDown {
    return commandKeyDown;
}


@end
