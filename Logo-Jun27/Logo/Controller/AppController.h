//AppController.h
#import "Common.h"

@interface AppController : NSObject

@property (assign) IBOutlet NSTextView *sourceField;
@property (assign) IBOutlet NSTextView *tokensField;
@property (assign) IBOutlet NSTextView *astField;
@property (assign) IBOutlet NSTextView *resultField;
@property (assign) IBOutlet NSTextView *errorField;

-(IBAction)runButtonClicked:(id)sender;

-(void)error:(NSString *)message;


@end
