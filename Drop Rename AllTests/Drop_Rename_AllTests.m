//
//  Drop_Rename_AllTests.m
//  Drop Rename AllTests
//
//  Created by MacPro1 on 09/01/2025.
//  Copyright © 2025 b23FF4U. All rights reserved.
//
#import <XCTest/XCTest.h>
#import "AppleScriptRunner.h"

@interface Drop_Rename_AllTests : XCTestCase

@end

@implementation Drop_Rename_AllTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
    
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
    
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    AppleScriptRunner *runner = [[AppleScriptRunner alloc] init];
    NSInteger value = [runner runAppleScriptWithArgs:@"TestFile.":@"Test.":@"EmptyTestFile.txt"];
    XCTAssertEqual(value, 0, @"Value should be equal to 0");
}
    
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a test suite
        XCTestSuite *suite = [XCTestSuite testSuiteWithName:@"My Test Suite"];
        
        // Add the test case to the suite
        [suite addTest:[Drop_Rename_AllTests testCaseWithSelector:@selector(testExample)]];
        [suite runTest];
        // Run the test suite
        XCTestRun *result = suite.testRun;
        
        // Print the results
        NSLog(@"Tests run: %lu", (unsigned long)result.testCaseCount);
        NSLog(@"Failures: %lu", (unsigned long)result.failureCount);
        
        return result.failureCount == 0 ? 0 : 1; // Return 0 if all tests pass, otherwise return 1
    }
}
