// Common.h
#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

#import "ErrorHandler.h"
#import "Utils.h"
#import "NSString-Utilities.h"
#import "NSBezierPath-Utilities.h"
#import <QuartzCore/QuartzCore.h>
#import "ReadText.h"
#import "PathAssistant.h"
#import "IO.h"
#import "Stak.h"
#import "Tokenizer.h"
#import "OpenFile.h"
#import "Modifiers.h"
#import "Global.h"


#pragma mark - Abbreviations
#define ccp(__X__,__Y__) CGPointMake(__X__,__Y__)
#define UD [NSUserDefaults standardUserDefaults]
#define NC [NSNotificationCenter defaultCenter]

#pragma mark - Log
#define logRange(RANGE) NSLog(@":: %s = (%lu, %lu)",#RANGE, RANGE.location, RANGE.length)
#define logPoint(POINT) NSLog(@":: %s = (%0.1f, %0.1f)",#POINT, POINT.x, POINT.y)
#define logPoint2(POINT) NSLog(@":: %s = (%0.2f, %0.2f)",#POINT, POINT.x, POINT.y)
#define logRect(RECT) NSLog(@":: %s: (%0.0f, %0.0f) %0.0f x %0.0f",#RECT, RECT.origin.x, RECT.origin.y, RECT.size.width, RECT.size.height)
#define logSize(SIZE) NSLog(@":: %s: %0.2f x %0.2f",#SIZE, SIZE.width, SIZE.height)
#define logObject(OBJECT) NSLog(@":: %s = %@",#OBJECT, OBJECT)
#define logStr(OBJECT) NSLog(@":: %@", OBJECT)
#define logDouble(DOUBLE) NSLog(@":: %s = %g",#DOUBLE, DOUBLE)
#define logInt(INTEGER) NSLog(@":: %s = %d",#INTEGER, INTEGER)
#define logInteger(INTEGER) NSLog(@":: %s = %ld",#INTEGER, INTEGER)
#define logChar(CHAR) NSLog(@":: %s = %C",#CHAR, CHAR)


