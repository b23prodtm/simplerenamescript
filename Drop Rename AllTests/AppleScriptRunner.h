//
//  AppleScriptRunne.h
//  Drop Rename All
//
//  Created by MacPro1 on 09/01/2025.
//  Copyright © 2025 b23FF4U. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppleScriptRunner : NSObject
    
- (BOOL)runAppleScriptWithArgs: (NSString *)findName: (NSString *)replaceName: (NSString *)filename;
    
@end
