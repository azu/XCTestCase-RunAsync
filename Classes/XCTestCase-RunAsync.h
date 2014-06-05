//
// Created by azu on 2013/12/24.
//


#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>


typedef void(^AsyncDone)();

@interface XCTestCase (RunAsync)
- (void)runAsyncWithBlock:(void (^)(AsyncDone done)) runTestCode;

- (void)runAsyncWithBlock:(void (^)(AsyncDone done)) runTestCode timeout:(NSTimeInterval) timeout;
@end
