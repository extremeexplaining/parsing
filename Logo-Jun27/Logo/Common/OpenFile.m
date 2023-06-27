#import "OpenFile.h"

@implementation OpenFile

+(NSString *)openFile {
    NSString *contents = @"";
    
    // Create the File Open Dialog class.
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];

    // Enable the selection of files in the dialog.
    [openDlg setCanChooseFiles:YES];

    // Multiple files not allowed
    [openDlg setAllowsMultipleSelection:NO];

    // Can't select a directory
    [openDlg setCanChooseDirectories:YES];

    // Display the dialog. If the OK button was pressed, process the files.
    if ( [openDlg runModal] == NSModalResponseOK )
    {
        // Get an array containing the full filenames of all
        // files and directories selected.
        NSArray* urls = [openDlg URLs];

        // the first element contains the path
        NSString* path = [urls objectAtIndex:0];
        
        // read the file
        contents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    }
    
    return contents;
}

@end
