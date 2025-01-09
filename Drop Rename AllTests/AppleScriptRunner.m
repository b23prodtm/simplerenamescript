//
//  AppleScriptRunner.m
//  Drop Rename All
//
//  Created by MacPro1 on 09/01/2025.
//  Copyright © 2025 b23FF4U. All rights reserved.
//

#import "AppleScriptRunner.h"

#import <Foundation/Foundation.h>

@implementation AppleScriptRunner
    
- (BOOL)runAppleScriptWithArgs: (NSString *)findName: (NSString *)replaceName :(NSString *)filename {
    // Load the AppleScript file
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"../Resources/AppDelegate" ofType:@"scpt"];
    NSError *error = nil;
    
    // Read the script content
    NSString *scriptSource = [NSString stringWithContentsOfFile:scriptPath encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSLog(@"Error reading script: %@", error.localizedDescription);
        return FALSE;
    }
    
    // Create an NSAppleScript instance
    NSAppleScript *appleScript = [[NSAppleScript alloc] initWithSource:scriptSource];
    
    // Run the script with the argument
    NSDictionary *errorInfo = NULL;
    NSAppleEventDescriptor *result = [appleScript executeAndReturnError:&errorInfo];
    
    // Check for errors
    if (result == nil) {
        NSLog(@"Error executing script: %@", [errorInfo descriptionWithLocale:NULL]);
        return FALSE;
    }
    
    // Return the result as an integer
    return result.booleanValue;
}
    
    @end
